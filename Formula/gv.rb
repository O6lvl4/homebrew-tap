class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.1/gv-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "2b85d44cced5dc47f99ad3f4edaca65d06a071957e0d7a7f38e576e1362acf3c"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.1/gv-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "13e58ef65823c2ca452b27aa08741b00e58a30b288b5576de644ed5693a2678a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.1/gv-v0.2.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c693d52ba097dc32b17a1e974cc4db576e35478428ac1e758f60fd4b5b542bb5"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.2.1/gv-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91b4c74e3cbc860c3f07593fc0920e778e91f45ece219a8b7af124ce0144829b"
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
