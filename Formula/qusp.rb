class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.24.0/qusp-v0.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "76d7f60b118b0a8064fbb26940b527eb13bb5672ff30f0728d923e27c611ad43"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.24.0/qusp-v0.24.0-x86_64-apple-darwin.tar.gz"
      sha256 "419b80a3826136a82c2738759ad1d0e20ed947b8c5364f2c2b5e730ff8c66367"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.24.0/qusp-v0.24.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9eafc35b4e85dc3534e674ef695dace878d6e2225552747c30041242500c37a0"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.24.0/qusp-v0.24.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2cc2c16ea1c378af60f2d61fb240e942c35a7d063ec26be85bd0229ab6d2859a"
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
