class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.13.0/qusp-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "13dbf3ad73a5696729ca3863df45cb168e41ce8f8281f4a95ba9de0e864a0887"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.13.0/qusp-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "3bd2af9ea8d96c09bd567a24f8c6a5a65186b378680803d8815a69ecc1f3be58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.13.0/qusp-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c789f4ea8068d8429faddfe041fe968e63667edab0e14c94da0a94de86eb88c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.13.0/qusp-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "74e34fd55e2eaab6e4f9c4a15b317a2f8447ec93b70f4042d2005ded492d67c0"
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
