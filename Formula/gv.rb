class Gv < Formula
  desc "Go version and toolchain manager — uv-grade speed"
  homepage "https://github.com/O6lvl4/gv"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c08a05a24a9811743af79e46126e8ff7b93889a5dd026d4ca72ec23968209c8e"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "906c6a5eaad280cd67f721db8f59ebab45754164276ee4ee4f6b9732c7297a7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "662f154f5641491baaebca3946cc3d0342a5de474dd11269cd812598f5e5ee8b"
    end
    on_intel do
      url "https://github.com/O6lvl4/gv/releases/download/v0.1.0/gv-v0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4aec6c2e3e55d0fa1074c28c2c2e787bace6b39c33609db7185544d79af6525e"
    end
  end

  def install
    bin.install "gv"
    bin.install "gv-shim"
  end

  test do
    assert_match "gv", shell_output("#{bin}/gv --version")
    assert_match "Go version", shell_output("#{bin}/gv --help")
  end
end
