class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.1/qusp-v0.28.1-aarch64-apple-darwin.tar.gz"
      sha256 "5dd3be3f8209e961a738fbd115ce6324e3a17a98402232068964c5413b8d90f4"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.1/qusp-v0.28.1-x86_64-apple-darwin.tar.gz"
      sha256 "1a488d0526e3b63cf7d87b48683e9fb2b94b23bd40e5cc523cffd4c16ce13b96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.1/qusp-v0.28.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4fbc8279cc8b28dc558893a4eba755072d5864a13f11568427f17d0f5e089d37"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.28.1/qusp-v0.28.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2706fdf9b1e08ead8b87ddb98f1a9ac198878c1a50da6f02b761d54d1acdfe70"
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
