class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.1/qusp-v0.31.1-aarch64-apple-darwin.tar.gz"
      sha256 "816f106389f3fe47c4f6d36a7bc348d18b1f21c93f7e667acf8a88f63a2d3726"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.1/qusp-v0.31.1-x86_64-apple-darwin.tar.gz"
      sha256 "97c96a87262ce9503a44f0b5aed70f5d9c7c79ead126e9a1aba419830063540b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.1/qusp-v0.31.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bea9edbb15ee778007fc886d7e96b5873432c850342cb787df3f1ce1601e427c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.1/qusp-v0.31.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a4c42383de7afd464758dcb39b16d389e2ee7dec336e44812c428a3126e7edaf"
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
