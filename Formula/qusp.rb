class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.22.0/qusp-v0.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "0387afaac949492363622d5b257a7cc81dba1566d7332a1a4f07e7a21a36dccf"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.22.0/qusp-v0.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "9e3fd79c441a8434292e8545b295c908146fdf2dc7edb1e5296288cf2eb39ae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.22.0/qusp-v0.22.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "57aa44a6df7ab74104c9a6a3154b0f86bc133a6b58550c5cdf204386d57f2f13"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.22.0/qusp-v0.22.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3f612ae151881eef7fff78f073c4c6e2cc3b3b0331e6f92378e206e6f4df7e83"
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
