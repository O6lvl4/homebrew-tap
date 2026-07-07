class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.1/qusp-v0.32.1-aarch64-apple-darwin.tar.gz"
      sha256 "c0ae7b4285eba6c9a469dc8ec08543a5bf7169805ef3a68013a16a358870621a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.1/qusp-v0.32.1-x86_64-apple-darwin.tar.gz"
      sha256 "a1bdaa6382a0cc55af649df30577ae79493bcda27e004cce469e82ebbde73a12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.1/qusp-v0.32.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a4b196f2ea84c784e6a1cf220985ba6ff797e0fe867efc31a0c65700201d9559"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.1/qusp-v0.32.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1344ac0fc56314916313a6a79bb5ea54ec9a59e75ee1267dc61fd60ce72009f4"
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
