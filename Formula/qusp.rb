class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.9.0/qusp-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "4ff8f21e680edb84f2f8bb08c541434844c16ddd5c6a01e2176c094d84b1ac5e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.9.0/qusp-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "7d19fb6ac5956fd1433c561ea4b65b51529c94ea8fa838bc51a0083dda6b810d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.9.0/qusp-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2a3e66159749a44b632043c7111f9d201753539770f959e489a8281ee8e739a8"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.9.0/qusp-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4f4654565ba8e48f175ea7b024cdc12081070766d567590f1f329b6a5b0fd0d8"
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
