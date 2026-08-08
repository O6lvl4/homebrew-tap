#!/usr/bin/env python3
"""Point each formula at the latest upstream GitHub release.

Runs inside this repository, so pushing needs nothing but the built-in
GITHUB_TOKEN — there is no cross-repository write and therefore no PAT.

Only the version-derived lines are touched: `url`, the `sha256` that follows
each url, and a `version` line if the formula has one. Everything else —
`desc`, `depends_on`, `install`, `test` — is hand-maintained and left alone.
Regenerating whole formulae from a template is what previously let a stale
`desc` and a literal `sha256 "PLACEHOLDER"` sit in the tap unnoticed.
"""

from __future__ import annotations

import hashlib
import json
import os
import re
import sys
import urllib.error
import urllib.request
from pathlib import Path

FORMULA_DIR = Path("Formula")
HOMEPAGE_RE = re.compile(r'^\s*homepage\s+"https://github\.com/([^/"]+)/([^/"]+)"', re.M)
DOWNLOAD_RE = re.compile(r'releases/download/([^/"]+)/')
URL_LINE_RE = re.compile(r'^(?P<indent>\s*)url\s+"(?P<url>[^"]+)"\s*$')
SHA_LINE_RE = re.compile(r'^(?P<indent>\s*)sha256\s+"(?P<sha>[^"]*)"\s*$')
VERSION_LINE_RE = re.compile(r'^(?P<indent>\s*)version\s+"(?P<version>[^"]*)"\s*$', re.M)


class Skip(Exception):
    """This formula cannot be updated; leave it exactly as it is."""


def api(path: str) -> dict:
    request = urllib.request.Request(
        f"https://api.github.com{path}",
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "o6lvl4-homebrew-tap-updater",
        },
    )
    token = os.environ.get("GH_TOKEN") or os.environ.get("GITHUB_TOKEN")
    if token:
        request.add_header("Authorization", f"Bearer {token}")
    with urllib.request.urlopen(request, timeout=30) as response:
        return json.load(response)


def latest_tag(owner: str, repo: str) -> str:
    try:
        return api(f"/repos/{owner}/{repo}/releases/latest")["tag_name"]
    except urllib.error.HTTPError as e:
        if e.code == 404:
            raise Skip(f"{owner}/{repo} has no published release (or no longer exists)")
        raise


def sha256_of(url: str) -> str:
    request = urllib.request.Request(
        url, headers={"User-Agent": "o6lvl4-homebrew-tap-updater"}
    )
    digest = hashlib.sha256()
    try:
        with urllib.request.urlopen(request, timeout=300) as response:
            for chunk in iter(lambda: response.read(1 << 20), b""):
                digest.update(chunk)
    except urllib.error.HTTPError as e:
        raise Skip(f"asset is missing ({e.code}): {url}")
    return digest.hexdigest()


def update(text: str, old_tag: str, new_tag: str) -> tuple[str, list[str]]:
    """Rewrite url/sha256/version for `new_tag`. Raises Skip if an asset is missing."""
    lines = text.splitlines(keepends=True)
    changed: list[str] = []
    out = list(lines)

    for i, line in enumerate(lines):
        url_match = URL_LINE_RE.match(line)
        if not url_match:
            continue
        # The tag appears in the path and, for some projects, in the asset name
        # too (`qusp-v0.32.1-aarch64-apple-darwin.tar.gz`). Replace every use.
        new_url = url_match["url"].replace(old_tag, new_tag)
        if new_url == url_match["url"]:
            continue
        digest = sha256_of(new_url)

        out[i] = f'{url_match["indent"]}url "{new_url}"\n'
        changed.append(new_url.rsplit("/", 1)[-1])

        # The sha256 for a url is the next sha256 line inside the same block.
        for j in range(i + 1, min(i + 4, len(lines))):
            sha_match = SHA_LINE_RE.match(lines[j])
            if sha_match:
                out[j] = f'{sha_match["indent"]}sha256 "{digest}"\n'
                break
        else:
            raise Skip(f"no sha256 line follows {new_url}")

    if not changed:
        raise Skip(f"no url mentions {old_tag}")

    result = "".join(out)
    return (
        VERSION_LINE_RE.sub(
            lambda m: f'{m["indent"]}version "{new_tag.lstrip("v")}"\n'.rstrip("\n")
            + ("\n" if m.group(0).endswith("\n") else ""),
            result,
        ),
        changed,
    )


def process(path: Path) -> bool:
    text = path.read_text()
    homepage = HOMEPAGE_RE.search(text)
    if not homepage:
        raise Skip("no github.com homepage to resolve a release from")
    owner, repo = homepage.groups()

    tags = DOWNLOAD_RE.findall(text)
    if not tags:
        raise Skip("no release download url to derive the current version from")
    if len(set(tags)) > 1:
        raise Skip(f"urls disagree on the current version: {sorted(set(tags))}")
    old_tag = tags[0]

    new_tag = latest_tag(owner, repo)
    if new_tag == old_tag:
        print(f"  {path.name}: up to date ({old_tag})")
        return False

    updated, assets = update(text, old_tag, new_tag)
    path.write_text(updated)
    print(f"  {path.name}: {old_tag} -> {new_tag} ({len(assets)} assets)")
    return True


def main() -> int:
    wanted = sys.argv[1:]
    formulae = (
        [FORMULA_DIR / f"{name.removesuffix('.rb')}.rb" for name in wanted]
        if wanted
        else sorted(FORMULA_DIR.glob("*.rb"))
    )

    updated, skipped = [], []
    for path in formulae:
        if not path.exists():
            print(f"  {path.name}: no such formula", file=sys.stderr)
            skipped.append(path.name)
            continue
        try:
            if process(path):
                updated.append(path.name)
        except Skip as reason:
            print(f"  {path.name}: skipped — {reason}")
            skipped.append(path.name)

    print(f"updated={' '.join(updated) if updated else '(none)'}")
    if skipped:
        print(f"skipped={' '.join(skipped)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
