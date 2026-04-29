class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.3/qusp-v0.28.3-aarch64-apple-darwin.tar.gz"
      sha256 "8297be30ff798cc46135914bfadda9029ea0656247f9552128b4153741493a79"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.3/qusp-v0.28.3-x86_64-apple-darwin.tar.gz"
      sha256 "5d3c2164c6b8a7064f5d76c33f35879a4697a7cf2dc0120ecbd37b5c0139d329"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.3/qusp-v0.28.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "99fdbec0cede921187a3615cd5d84be74b875f27ef04fdcb1cedab4a969673f6"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.3/qusp-v0.28.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5ad1b3719b7834bedfbff0d994b4862bf0eed2753808d139bae6e2f7044541d1"
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
