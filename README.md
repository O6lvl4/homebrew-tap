# homebrew-tap

Homebrew formulae maintained by [@O6lvl4](https://github.com/O6lvl4).

## Install

```bash
brew tap O6lvl4/tap
brew install gv
```

Or in one step:

```bash
brew install O6lvl4/tap/gv
```

## Formulae

| Formula | Description | Source |
|--------|-------------|--------|
| [gv](Formula/gv.rb) | Go version & toolchain manager. uv-grade speed. | [O6lvl4/gv](https://github.com/O6lvl4/gv) |

## Updating formulae

When a new release is cut on the upstream `O6lvl4/gv` repo, the `release-tap`
workflow there automatically opens a commit against this repo bumping the
formula version and SHAs. No manual editing required.

## License

Each formula tracks the license of its upstream project. The tap repository
itself is under MIT.
