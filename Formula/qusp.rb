class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.25.0/qusp-v0.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "67d8d795b1032f0385cc6734b3de425c9333b4b9ac4c00d521d7fb3edc599e1f"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.25.0/qusp-v0.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "a299ffe126b5e87a032b82f67b9d2f6fef324fcd03c3e4d576a393411e415cc8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.25.0/qusp-v0.25.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4e59d958cc84d7ff9d946b6f2807cc9312ccb688a7b38b273417cf3826cce1e3"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.25.0/qusp-v0.25.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "44c4b0b942d986e7f3c3805dd0b4a49353fee16ed9f51da5225848615cea5940"
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
