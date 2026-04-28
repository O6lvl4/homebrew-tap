class Rv < Formula
  desc "Ruby version and gem manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/rv"
  license "MIT"

  depends_on "ruby-build"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2454e23113f2b3a1c8e6f2aa2602dff68ce32cbe9801f91dce67e037f46281de"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "57bfd208cb722bbb3904ba0491387699d06defdfe44bbc84e4acaec2320ab4e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ebb2df64de6a6c49c4dbe3e1d9f8157baf80c47b98eff0786c3b501e6aa3c958"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.2.0/rv-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c03bf55c64d8e9ab9404e5fb57ed2ab9a025018c542673fbe2a6e7a64da88c3"
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
