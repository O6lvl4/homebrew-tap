class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.1/qusp-v0.29.1-aarch64-apple-darwin.tar.gz"
      sha256 "3dba8f8bf67101c2ff5622b20014c12ce6272041261d63204d67054ae317db0a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.1/qusp-v0.29.1-x86_64-apple-darwin.tar.gz"
      sha256 "1ee8edd116c6a20211f6a08000287ff79f7da39dfd37027c6b29b67fd467d05a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.1/qusp-v0.29.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5db1179039d38452d6e452d88997737fea636ff9fbcb21f3caedb46f094fa45c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.1/qusp-v0.29.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "612885695ebdd848234542ef221927a5e6802ad190c8214e4b26a3d23dbf434c"
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
