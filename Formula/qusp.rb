class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.2/qusp-v0.28.2-aarch64-apple-darwin.tar.gz"
      sha256 "f5f1a6c93795f3db1c763d233f9608a1299787eccc1ada9a097113b2fa732939"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.2/qusp-v0.28.2-x86_64-apple-darwin.tar.gz"
      sha256 "bad0a033ffdb045bc36541df2ee901d296a657f95922d159a2fc0cb06d9bbab5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.2/qusp-v0.28.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f4f489e3bfc6dbbdfff3e81f4977454b7c1807e2c402c86e1b411cec8c49f015"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.2/qusp-v0.28.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9f178a51f41e4df735f3c681c371f7b6afadf7daaddfd4108bb18ba54cca46aa"
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
