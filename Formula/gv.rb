class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.2/gv-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "6498610b4f18186d16c08f563f19a9ed707148cbd9c970e799b574305991aae6"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.2/gv-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "dad5daa1dfa2ea2ad77aa53c92eacf75634a6239cd2d6197601da66e455a2e5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.2/gv-v0.5.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6696018394be55985bd184c94ca7573e75f51c4681a4e46802775ef01082f288"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.2/gv-v0.5.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5230d4df290b46e4fe62e594da7de0b18ed95c97fa243651b090239577bddd3f"
    end
  end

  def install
    bin.install "gv"
    bin.install "gv-shim"
    # gvx is argv[0]-dispatched into `gv x …`; ship as a symlink in the prefix.
    bin.install_symlink "gv" => "gvx"
  end

  test do
    assert_match "gv", shell_output("#{bin}/gv --version")
    assert_match "Go version", shell_output("#{bin}/gv --help")
  end
end
