class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.0/qusp-v0.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "cdb7ad8996a89b0a6bd7a660fe6603318f1b2210b0edf696d6e6518500aaa2b2"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.0/qusp-v0.28.0-x86_64-apple-darwin.tar.gz"
      sha256 "002176f1b03aeee9cd0754280920dd5e3f3a0dc3e4a6b73a3030357b4d8c04c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.0/qusp-v0.28.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "618ef4a0939b34227ab1ee6409860f9bfe1c3ff797b95a8d7128a2848942ee9c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.0/qusp-v0.28.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "34ae760509413741750f01f019bfb1991d26b491c38e67ea2a1b363f9bcccd24"
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
