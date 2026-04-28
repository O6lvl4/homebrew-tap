class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.1/qusp-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "050e51d46107c0df73c126d1c9bc59a5eb2629fdf2b0cbf505d7f11c32ec0101"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.1/qusp-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "7bf7b4487ed6b14b02016f0b2c6cb3af990a2e1f57db73d092917311b24aef61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.1/qusp-v0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "98ab1869c86352b491ab97d0cf9250fdf0adf9f1adcfcc06be006d6a986a701c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.8.1/qusp-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd381bae02d72e01ed05eedbf155eb688147f20e8563d6e68996fdd01054de1c"
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
