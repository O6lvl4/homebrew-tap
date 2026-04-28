class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.0/qusp-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "7fec46e0312c7fd75a0f2a276ac853beeb2030f549c23daeab7fbdc6b63c01da"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.0/qusp-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "04add46d6eea28b65eec139fbbe6bbaf5a6da4f1fa8f3c6f0f8284d3d4c58c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.0/qusp-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b72d24e876d8f2b17d8bf9a96fc8fc4bf3aa850e6ba49ee45bbff9430aded717"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.12.0/qusp-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2a03178108e50be85f21a4b857c6658a5cd9efb2b6faddaf811db9037c57c979"
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
