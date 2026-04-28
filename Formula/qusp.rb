class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.1/qusp-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "853be619373c7a71d80dded535f13bc1e6a2907b52cf5db9c9f287c64334a07a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.1/qusp-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "32a0a7967ba19f55653831cefdab9e7906b5a390df5c5d5b50123ea21f118659"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.1/qusp-v0.12.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4779e232f0c268ce9b1ac315729263cb556ca7c62174eb0a9c0e19147bc53d23"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.1/qusp-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b96faf114a9abe6cf6496850b9c591c89e393bd1762c337a483887478a64469"
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
