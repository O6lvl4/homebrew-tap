class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.10.0/qusp-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "deeb5df7a47590a742eae9202c6150d0a714ea2f69d99e0fffa3586499af5725"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.10.0/qusp-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "726f0d81147656e421b1c2f9d2d216f698ce4546fe5805fbf8dfd716e5346e37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.10.0/qusp-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6a6e3187ec720adb3851b774217e8355d66baecb669e4f8f898a31483f18121c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.10.0/qusp-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf3d1c5486de640f856c62648ab08f20f94ff711258fc024ba0b1f44f18e135a"
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
