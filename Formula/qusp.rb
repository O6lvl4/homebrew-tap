class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.0/qusp-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "078bcc176ea2d1426ce4c2913387bc620f43adcaf53c55ef70eb888f1c8fba52"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.0/qusp-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "84809c59bf8d9e5a3f83e6da336784b7bc6e916db184f681b81cdf1e9280dc87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.0/qusp-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d9b174316632fd0044dd9b80e449682e05bc6912497be7169733f8873c1cfc85"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.0/qusp-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3be1aa0ac4faf1c1abde8a50d629a741a4d6c2f68983b0aafdfe1b4dc18c2814"
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
