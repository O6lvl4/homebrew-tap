class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.21.0/qusp-v0.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "c17730d0be47fa9ec6fcc67d8b85246add1cef37f1a88179fa179e410b307f2c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.21.0/qusp-v0.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "703532c261dd50ba1bd100e0987b6286e6f9d077a693c19387df4c4ab9d4f9c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.21.0/qusp-v0.21.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "550d2a50ca0b920472a317824c5b7a2d01a1d65908d190c6eae659180545169c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.21.0/qusp-v0.21.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "604b609e2585095098b0cc84b5b53efb020f6891767928aa6cb18001afe09431"
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
