class Codopsy < Formula
  desc "AST-level code quality analyzer for 35 languages with 182 lint rules"
  homepage "https://github.com/O6lvl4/codopsy"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.2.0/codopsy-aarch64-apple-darwin.tar.gz"
      sha256 "61ebc751b8def53b6be0f905efad65dcf140452d923fd90b6d932969195a555e"
    end
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.2.0/codopsy-x86_64-apple-darwin.tar.gz"
      sha256 "d5067ea508857ce7449dcb6fa8ebf2d95618d4a57275be5941b5c417ad423ee5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/O6lvl4/codopsy/releases/download/v2.2.0/codopsy-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4495b5aa3073a2d1b85bf25755d322c619508e510c75d007d3bf8d324e4792ef"
    end
  end

  def install
    bin.install "codopsy"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codopsy --version")
  end
end
