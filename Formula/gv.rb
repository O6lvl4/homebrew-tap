class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "6ac4bee2017d87aac2df547042fd6c3b8d0c18ab210e8d9fd793f52924668c9e"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "3b85d49193d558de546443599cee69536730610ac87ebeaaeb971bfd8e48c60d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3cf6e4f5c3760bf8a0c245801c1027a25c63f390796f659dbb3fd580ab9da517"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6ee2f76bcaed90e599c75c1d7694fb2cb0fe00c18afef11d73998c3d6a3b717d"
    end
  end

  def install
    bin.install "gv"
    bin.install "gv-shim"
  end

  test do
    assert_match "gv", shell_output("#{bin}/gv --version")
    assert_match "Go version & toolchain manager", shell_output("#{bin}/gv --help")
  end
end
