class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.0/qusp-v0.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "3de25f3d6bbeecfe205a8140a155648fb041ed3bdf70cd61ecb875a59d9673fb"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.0/qusp-v0.32.0-x86_64-apple-darwin.tar.gz"
      sha256 "f7ecc48d928dd8c4aabbdcfec11117b6d9db00cd729e7348a8262637e1102694"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.0/qusp-v0.32.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f0171a10bc6e98960c1f2a42dc65283f6f9e5444928d37a24d0c0723ddfc358"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.0/qusp-v0.32.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "699560d6a7db76e3f720e417568f7c2f6e189ca4cc82fe97f8267746f68373ed"
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
