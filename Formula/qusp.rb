class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.6.0/qusp-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "91dfac403961bbdf93ada8e8e15f3663c75011b4b5aedad6681219d06346a86f"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.6.0/qusp-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "0c78fc76d3a4a302ec22ac05f2bcd4976096535c14cdefd07b11a1ea77704c89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.6.0/qusp-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f2230707160196e9c764143632f96700f57df2c11733f78b91e23d19807f818"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.6.0/qusp-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e137ed6d566526e3073c137e69d61d090fe63fb9dc441d8f3a9c6f08271fd1b3"
    end
  end

  def install
    bin.install "qusp"
    # quspx is argv[0]-dispatched into `qusp x …`; ship as a symlink.
    bin.install_symlink "qusp" => "quspx"
  end

  test do
    assert_match "qusp", shell_output("#{bin}/qusp --version")
    assert_match "superposition", shell_output("#{bin}/qusp --help")
  end
end
