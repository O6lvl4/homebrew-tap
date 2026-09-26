class Codopsy < Formula
  desc "AST-level code quality analyzer for 35 languages with 182 lint rules"
  homepage "https://github.com/O6lvl4/codopsy"
  version "2.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.3.1/codopsy-aarch64-apple-darwin.tar.gz"
      sha256 "a8c4543f3ce7359a5f38caf48cdd8ebcf353f0ffc95a49878fea2c513dd335ff"
    end
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.3.1/codopsy-x86_64-apple-darwin.tar.gz"
      sha256 "77f357cc6d88f13ed74bf1a0ae16c32db45b75e5a477334d5369071c8ddb7b95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.3.1/codopsy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d9d7865b14969d4483391c6afa2984df5619c2bdecacf12e0ebbbe3f4583689"
    end
  end

  def install
    bin.install "codopsy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codopsy --version")
  end
end
