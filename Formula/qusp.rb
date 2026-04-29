class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.0/qusp-v0.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "1a10cc77b71d42b189808f21e600148ece7469f3e2c038aea9f5e0da51f8c77e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.0/qusp-v0.29.0-x86_64-apple-darwin.tar.gz"
      sha256 "93e30797b6a165b3c4248106232f752a93374368492959deeb19782fe893e27f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.0/qusp-v0.29.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "67f8080feba7ad02c20e6cf81dd7349178da66152b3818109787518f6f5d1473"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.29.0/qusp-v0.29.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e8d0e569dbad9374d18d0ae20c6513ab7f0ca5ffe05184cec443fdfcc024e40a"
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
