class Qusp < Formula
  desc "Every language toolchain in superposition. `cd` collapses to one"
  homepage "https://github.com/O6lvl4/qusp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.2/qusp-v0.31.2-aarch64-apple-darwin.tar.gz"
      sha256 "2d06134907a83b8738af13758c355bcb3df1c8b19aa560d36b1ce6d0f3a1e38e"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.2/qusp-v0.31.2-x86_64-apple-darwin.tar.gz"
      sha256 "d7fc426e7a3b792645abee767dd0959800039cb733135139e977e808da7ec5cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.2/qusp-v0.31.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8e0c5987bd43641f87584837508b61c05e965507dd161462927f3af0623ffea7"
    end
    on_intel do
      url "https://github.com/O6lvl4/qusp/releases/download/v0.31.2/qusp-v0.31.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b378398390fc6209341635eddf10bc90f315467f13dda511e6ccbcfc0b5d4dfa"
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
