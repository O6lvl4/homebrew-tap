class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.11.0/qusp-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "ab674a479c51c12cccdb2ffa4e26895051685dc0348463d7b49daea7d43e101e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.11.0/qusp-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "925cd3e0b80211999ff6591d8ca89d2719a1846c1a90bd8c507676da5f36a43c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.11.0/qusp-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c4394c3a56307659e011996e9b5a0a442e30f1ce5599ba1aaa2a9d32f13a861"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.11.0/qusp-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0b8fa73d14ccc75fdcda2ebc24eab45f0c6e68997ea030cb509d0e3efd622749"
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
