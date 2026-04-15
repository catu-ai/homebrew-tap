class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.2/easyharness_v0.2.2_darwin_arm64.zip"
      sha256 "e81fdab8fa28b1c5a054f879a4d016dfb994860f02a24091846b0bcc5c1b26b1"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.2/easyharness_v0.2.2_darwin_amd64.zip"
      sha256 "1937b94983f59571461d3fb4db656c1cb11f233ff3acdf580b8cf7008360c47b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.2/easyharness_v0.2.2_linux_arm64.zip"
      sha256 "0dbb25b671d3622379d963a6071bb7ae59e2474e1786cf6d58a0c6aacf4f5f1a"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.2/easyharness_v0.2.2_linux_amd64.zip"
      sha256 "aea41475b521d764035a3747bd3d39798cf14cf4d335cede868b8b4f7b19556d"
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
