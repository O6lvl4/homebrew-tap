class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.6.0/gv-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "fb3645787f7369036829cd5eb0e452dd554ec7ab6f2589560bd0b703aca86408"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.6.0/gv-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "7c97ae8d39ce32ee4c806712bc6270bd0ba60246384ce3b21e6307beaff9099e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.6.0/gv-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "883ce6a042eff1d82ba20959f391e3bce2e829d955d8aa49ace4bfc0b4f0dbe8"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.6.0/gv-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5f841ffdcd363bad2c7f9c62046c362972b3e79c32329cdb663526d656ad30ad"
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
