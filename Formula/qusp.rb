class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.14.0/qusp-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "b589050743e03cee4961220748dabbf032dce17a0c8f5815ef6cff07f97b1a5e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.14.0/qusp-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "9eefaf5cc3892170b043d3b1741c9e3f7dfe49350fc099dae1bca1224b4f7ff4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.14.0/qusp-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "34ffa1a30ff2b3cd1c078136186d9594f6f3d44fcfaff16c15afcd0fb8d66643"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.14.0/qusp-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ed0abff9134c5eb866d737620f0dca8cee8401cb9dcbb6951244f29390dafa05"
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
