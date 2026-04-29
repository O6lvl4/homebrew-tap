class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.30.0/qusp-v0.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "bfa1c239ab49eae524cf0a6e4d39027f7b127d83d8b26e627f59af651f39706a"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.30.0/qusp-v0.30.0-x86_64-apple-darwin.tar.gz"
      sha256 "51055474d27cebc727d3ed484be0e9993e5461312c101af6b0f2458f6080c03f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.30.0/qusp-v0.30.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "02ebdbaac6858f4e2cb9ede6ba26c9564df2e4f80374e6e616313a3499cb6108"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.30.0/qusp-v0.30.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "cf4eec993bbeed752b1560cae286363d2e1f50d6b78984be6f31a9b2342ad525"
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
