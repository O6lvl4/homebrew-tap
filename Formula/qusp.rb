class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.26.0/qusp-v0.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "6705dc352e2ed3362898473ae9b00465c1af3dde6f9deb249ee56fd349070395"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.26.0/qusp-v0.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e0c60eeedafa84dc6cb9c6cd512316bb434a21557f4265c65b3ee77ed61a93b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.26.0/qusp-v0.26.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "427c4791a906d853125edb3f6ccdab1c0542c0d4f0446474a8d8afe6ca0ddbbc"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.26.0/qusp-v0.26.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6e9788cf10ce3beb300033a7bfc785e68a06ade656ce9d5d23e3ee7f45496085"
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
