class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.1/gv-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "9b537934e6908074da68cdf64ca78f69686d50a3ed1f131c0a30f2a6ed43e765"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.1/gv-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "80e3de1b049f63ae08024721152269d158ac4d1c4d9458fd080fa2cbb9dac3a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.1/gv-v0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "773849dec2f770df5d404707637dbd0082b6e80c0f8b0b91366c721eac2908ac"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.1/gv-v0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "789d12032e0237f83150fc5420abefdf645ff418f206cfbefa37ace2912071cc"
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
