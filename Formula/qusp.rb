class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "6b5024de5a24baa7cec2bb25f6376b77645fc3d347626b2b048f46cfd5af5dbc"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "17fcbfb94a23f45a87bbcbf259786ac5a64d42bf6320c57fce2612c90aa18bca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "24fcfb1cd65be5fb7ac516cdb374f037b44573cd8cf3bb3eeecf29f9b286534b"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "31e92ba41853999a701147c071acff805b208134b69752c16f490bbc80889601"
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
