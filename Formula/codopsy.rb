class Codopsy < Formula
  desc "AST-level code quality analyzer for 34 languages with 174 lint rules"
  homepage "https://github.com/O6lvl4/codopsy"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.0.0/codopsy-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.0.0/codopsy-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.0.0/codopsy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "codopsy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codopsy --version")
  end
end
