class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.20.0/qusp-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "81079aca8826c22a46fc571e41ce3ebbdd2fa5d21463787ebe89770adcfcbaf7"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.20.0/qusp-v0.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "9ded5d926806088035a6ffe4cc0ecfe31c0811cb75c2d9ba68233e72724cab8b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.20.0/qusp-v0.20.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5343202ad7e55c40b66fad08acabe836a250ac2e375ef6daa5585a9a42536400"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.20.0/qusp-v0.20.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dc7f4e34c6e4ce4cb534d8e5ff29bea9fc3a62f2e2dab83b60960b038888c0ae"
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
