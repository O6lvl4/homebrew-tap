class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.15.0/qusp-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "4173fed799507b974f943900f9d4fee23706ad0339ee107ae666fef6eaca7e4d"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.15.0/qusp-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "b5eba27971abf3f49f7e9b7f98083f4b3960feffd5065bca476ab8d5ddab6f13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.15.0/qusp-v0.15.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "11d7745bf0fa7d849b886a2dbc0288f6216dbd04b23eaf5f01602993fda17b93"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.15.0/qusp-v0.15.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d056780b595300f4418f9ad3e6558d20e8ae6da15add9ce439b1175c2bef7d63"
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
