class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.23.0/qusp-v0.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "9ff8052257862f0de76935c4fd3f76110302da0e1b38faf89a640a38ca99bb84"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.23.0/qusp-v0.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "f1fe4e5943c66dbf425591e943a69744537357dc79f0133c383e6efc91ed26d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.23.0/qusp-v0.23.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "715f250341f20199186d1f48ecef8c082bf1aba66c858b4ed3df772b45acb92d"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.23.0/qusp-v0.23.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "847e9257381c8171f3298d32797c68fe665a261f4dfdfdce6b8e651f2af8412d"
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
