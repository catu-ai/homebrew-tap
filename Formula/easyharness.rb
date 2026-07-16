class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0/easyharness_v0.6.0_darwin_arm64.zip"
      sha256 "0c1ed957ac7f98a6a9790340e057ba5fafda343e855e33d3d3a5bb365a72f160"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0/easyharness_v0.6.0_darwin_amd64.zip"
      sha256 "dff40991267144b197cb4384cf9f5f75e3874dc6753da6c9f3a053b525fed033"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0/easyharness_v0.6.0_linux_arm64.zip"
      sha256 "5a14d5d81ddbcbe8d9dcd0b92b14a97a0b31194aeb2518058db65cf3105bdaef"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0/easyharness_v0.6.0_linux_amd64.zip"
      sha256 "3f3f73f63bce50b49b7020765cb5635ee3c4b9e2fab8fb3757d5bd8a35f1bb2c"
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
