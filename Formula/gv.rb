class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.0/gv-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "fdb4a84908ab8867b5154f673ebfe1f6265311437487d010ad639fab0c8572f1"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.0/gv-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "7add64e2b286457982a3097f48d85269784296738e0b9d3dd55b3888d31b2fee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.0/gv-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6d0cc7c9133fcbfc10e820dc260728befaa313204853d4e25e6f93435f6f7a97"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.0/gv-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "817fb5d879bd53b460b5fe6beceaf2f87a482852e0799329e8f985aab4d3e289"
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
