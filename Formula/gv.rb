class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.4.0/gv-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "83932d087da31bd8679dcf31dc8e967ebbe752fbb8f2142afdeff8d1a9b37533"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.4.0/gv-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "efc251fd7970cdc8f777bcab1930251dcb3a92af44ef2cc718c33c2781071739"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.4.0/gv-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "99157c059a5ad338eb7f58bfbc054ff58c5c6bd22ed0978327c706411f2fe09f"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.4.0/gv-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1716e39d3e1c48a06fae97fcea4e0a2e2234c6794a43ec5d504f58d5167d3b00"
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
