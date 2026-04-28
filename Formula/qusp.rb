class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.27.0/qusp-v0.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "494bd8cef7dcfa7f06852e4f2b0ca0951c36b7f846c7135f2f7a380724a9cd6b"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.27.0/qusp-v0.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "dab98aa61d5ed55b3a899c586bfa46f6b471b0c018e2bba7978b8d6379b39371"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.27.0/qusp-v0.27.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4d86e1f4f67545e2423ebc175ecda18534b3aa663f28b13eaac361f459dafc5a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.27.0/qusp-v0.27.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70dd7847c54fd002601b350b0e67744522625709426df51399df7e6b57020a00"
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
