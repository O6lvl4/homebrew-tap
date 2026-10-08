class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.2/qusp-v0.32.2-aarch64-apple-darwin.tar.gz"
      sha256 "0b2292709b0b93f7d9ead702b6d771965c9c2963880f9fd69789fad6cfeecb2a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.2/qusp-v0.32.2-x86_64-apple-darwin.tar.gz"
      sha256 "0a24d3d7cf5f7a6a8e252bc37c39dd0171dae70145758b4ef57a5bc1e2eef118"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.2/qusp-v0.32.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ef08bfc1a9b409da0c2f783aa726b57af93dc8d5dc01859ebd54b463d777b35c"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.32.2/qusp-v0.32.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "438e26131045a842b552749e076f9a7c8d29a266e0d8fe515ac584787b828c5a"
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
