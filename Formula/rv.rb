class Rv < Formula
  desc "Ruby version and gem manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/rv"
  license "MIT"

  depends_on "ruby-build"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.1.0/rv-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "ab9881f1656733a0ed1d584db104d8b6402a0e39dd515c71b292f6875647eba7"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.1.0/rv-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c27c121d40820bc7dae0abe535c84f25a9c83775aa24811d145df651d558221a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/rv/releases/download/v0.1.0/rv-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2443939c577e110387270ea74ed4aeae2ec96007764b02e3bfef43eeeee72602"
    end
    on_intel do
      url "https://github.com/O6lvl4/rv/releases/download/v0.1.0/rv-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6bd78d74b7c39567e357544d547eefb12caf5bfbd3662fa30f372be00840dbff"
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
