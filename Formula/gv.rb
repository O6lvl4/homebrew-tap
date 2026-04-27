class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.3.0/gv-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "ad7ccbf102b467320646ce8b6277b814ef8bdb559fe7bcf78e791cb21feab04c"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.3.0/gv-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "d2482f4ed94048885724f277793d5ee0e6de68156fbffc5bf96f37254b31a523"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.3.0/gv-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f39dae368121dde982e323796d83d22b5f7173b067f9834a769aa955adf8f9f1"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.3.0/gv-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ad4e8086f5d2c3bbf2198728f4d2aa04ca5b1de1835929a94cfc098347bfac11"
    end
  end

  def install
    bin.install "gv"
    bin.install "gv-shim"
  end

  test do
    assert_match "gv", shell_output("#{bin}/gv --version")
    assert_match "Go version", shell_output("#{bin}/gv --help")
  end
end
