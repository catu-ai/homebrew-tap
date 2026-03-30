class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.1.0-alpha.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.5/easyharness_v0.1.0-alpha.5_darwin_arm64.zip"
      sha256 "5264d3d8000b562b6f14811f3139ce6be686e040c4b08d8759c478c40cc60c55"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.5/easyharness_v0.1.0-alpha.5_darwin_amd64.zip"
      sha256 "980a2d2d72b34f88a21053726a672a864482926ab94841caefc41f23a898d657"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.5/easyharness_v0.1.0-alpha.5_linux_arm64.zip"
      sha256 "428aff2f35979d62972ad35a9b87e6c8afda162d798d0faeb6db854a1f5e8aac"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.5/easyharness_v0.1.0-alpha.5_linux_amd64.zip"
      sha256 "62251828855ccbdd44fda3a2a47505c60188a9bc2516cde34d6dbc0c381f0d0a"
    end
  end

  def install
    bin.install Dir["**/harness"].fetch(0) => "harness"
  end

  test do
    output = shell_output("#{bin}/harness --version")
    assert_match "version: v#{version}", output
    assert_match "mode: release", output
  end
end
