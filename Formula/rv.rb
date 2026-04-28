class Rv < Formula
  desc "Ruby version and gem manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/rv"
  license "MIT"

  depends_on "ruby-build"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "76c8bc1943b4edbd8f8579e1b64b3d957d1d885224bf1bd94a18b600ae56da21"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "e5b990b9529ac8a3b010b8c22953eb0e79eff7a98f216325562182b2d4176d80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f3c4ab6d4b2b1e05bdd8bb29d69fe49f0563715bb984589ab3df14849536b5b4"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bcd2efd34a02221f27ffce97080612fd9d7bd373e03b415736d61224b0005b7e"
    end
  end

  def install
    bin.install "rv"
    bin.install_symlink "rv" => "rvx"
  end

  test do
    assert_match "rv", shell_output("#{bin}/rv --version")
    assert_match "Ruby version", shell_output("#{bin}/rv --help")
  end
end
