class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.18.0/qusp-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "474c72bdf697baaabcf21058103a0aaae7221c79704ba45e80ae39d218838a4b"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.18.0/qusp-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "1013b01098944bef9cd01c25ba6d9f4f61ed077106cf5f0845fdf1f2a58f282d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.18.0/qusp-v0.18.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d3e75d1c78796bf293942b541d16983704fa14dc376f7f5e2b0ca1591d73de2b"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.18.0/qusp-v0.18.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a46709f86f5948a6e3bc1c0be240665c0e7a60304a73fd3d6d92a878fe2c38d6"
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
