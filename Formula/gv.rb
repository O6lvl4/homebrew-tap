class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.0/gv-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "04a4f61c8456bc0c0dfa6e89abf4fa888e007e4fd230d18f90500bdfb091e2ff"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.0/gv-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "15d6efdd35626be247174cdf691b40f666c8f4f3b914a3393df82c9fb315d473"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.0/gv-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e860bc2edbe6481a17cba5c2ab1a623f0ba5ffb48025849bcb5d089432ec3d0f"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.5.0/gv-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9ab9aa75fff6b72a59deead7e97eb7a63519496e9296fa07f0e11dd410a3a5e9"
    end
  end

  def install
    bin.install "gv"
    bin.install "gv-shim"
    # gvx is argv[0]-dispatched into `gv x …`; ship as a symlink in the prefix.
    bin.install_symlink "gv" => "gvx"
  end

  test do
    assert_match "gv", shell_output("#{bin}/gv --version")
    assert_match "Go version", shell_output("#{bin}/gv --help")
  end
end
