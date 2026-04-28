class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.19.0/qusp-v0.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "6386fd2d807666ed785cb86722663402abd053a603a98cf7a338c2fc2acce9bc"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.19.0/qusp-v0.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "24c867480cd36ca51eef9162f4f6fc8251310431614c53bb98c17c2224585c0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.19.0/qusp-v0.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6f6a6b5bd4baf6a0fbbf2ef2f7e669cb49f10a00611b49022ef5486a4a04b62e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.19.0/qusp-v0.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a9754bb24158ee319893e6895b57ca217c155fd5ad4aae3893400fd416e76f58"
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
