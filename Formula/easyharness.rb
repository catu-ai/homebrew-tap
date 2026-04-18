class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.3/easyharness_v0.2.3_darwin_arm64.zip"
      sha256 "2d0716f596d5c256c2503a2de3188e9e419fb69cd496b3bd4eca445e41d3c4cc"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.3/easyharness_v0.2.3_darwin_amd64.zip"
      sha256 "3653a01e278f52acb0f23ae0764e33bd7b884b67f4fcee0b62b8a1245d880d68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.3/easyharness_v0.2.3_linux_arm64.zip"
      sha256 "ce0041297e75b6034535113e6da35c9c04c0853de4f78685f3b71f7dc208c03d"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.3/easyharness_v0.2.3_linux_amd64.zip"
      sha256 "c828dd33072474e6b8443e8b999946938fd328b684fed5e1d589f251db35369d"
    end
  end

  def install
    bin.install Dir["**/harness"].fetch(0) => "harness"
  end

  require "json"

  test do
    output = shell_output("#{bin}/harness --version")
    parsed = JSON.parse(output)
    assert_equal "v#{version}", parsed["version"]
    assert_equal "release", parsed["mode"]
  end
end
