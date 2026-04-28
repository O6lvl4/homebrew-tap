class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.17.0/qusp-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "44870dbc94ef5abab982d00ea2ed38511784c7c9838532de998a22ff1bffa3c5"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.17.0/qusp-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "eb864e252a34fb9b72978e4fd0f4f009e987f77a8ca3c082284a6c22dbcfb6a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.17.0/qusp-v0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "16842b13dff696cdf7a7670b661a045f0374c3eb132aca919faa47d39679bbdc"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.17.0/qusp-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d6004c6b1bfbeaf10de265f1f5b6d4caf5eea2fcc53667e3fbad87ed21ebc7dd"
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
