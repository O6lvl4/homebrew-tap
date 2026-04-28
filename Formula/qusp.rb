class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.16.0/qusp-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "f48d45e4a9d50ba5f8f64c031ec18bd63be6c63b9087b402535a13b5bd149cb3"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.16.0/qusp-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "3aebe43f0175d6df6aa510e891b1c912771a7cce2f5d928e2bf178430b45911c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.16.0/qusp-v0.16.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c4c1fee7c8253596fd2d1b7992ff07db6993665586e85cdcc5adfd4ef8db0c4d"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.16.0/qusp-v0.16.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a2829132b4f01f14486c46a0e2af8493967dc18f5c198eb4173c89765ed4dfb7"
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
