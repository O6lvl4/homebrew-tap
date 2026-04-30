class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "0462ad7456f507a358680f07a27769b20598c7def1d4e18f4ef839abb91ff21f"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-x86_64-apple-darwin.tar.gz"
      sha256 "190b6f6d7b4ddce971ce2170cbdf1f48592d19f75c0f1fc24fbe3c16019ede4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a9fbb89f5229bf83eea45afd6dc61f54380967b01a1ef6d642cae596ab7b9562"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.0/qusp-v0.31.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "004b071a143a9a9dc463a4e4c2470bee0a3927c157d9f232766634f3b0c18cf9"
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
