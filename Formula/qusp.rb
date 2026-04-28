class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.7.0/qusp-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "3061dd029bfc1c437e37d03749713f9db2aa1efc3dc009cff60a22d9d9bdd720"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.7.0/qusp-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "64d30b45f72f1c906a03fb82de2cbf496265b3dfe82adc381cb0857a5e2d887a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.7.0/qusp-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "aa4c62a9e124484eeb16e476fef944a6704f00b8e0351120c315b2403dba7379"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.7.0/qusp-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3169f9b9554d77fcd1cfa182fda144250731090f3dbb1e6d8ec61f8a5d991bdb"
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
