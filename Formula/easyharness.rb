class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.0-rc.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.2/easyharness_v0.6.0-rc.2_darwin_arm64.zip"
      sha256 "5cefcd352afba11e0b1b01fed48ae5edfb859b6f00b89190becf5f0c5766bf12"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.2/easyharness_v0.6.0-rc.2_darwin_amd64.zip"
      sha256 "effd7814ede4a0dcb17f345e8ffa6b6ba8688a01e7b6834251f51998c03822ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.2/easyharness_v0.6.0-rc.2_linux_arm64.zip"
      sha256 "26c31be210603a69aead5eb548ff0d2af8003b012e935cd59c5a251b6aabaaa6"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.2/easyharness_v0.6.0-rc.2_linux_amd64.zip"
      sha256 "a4b60e697bb17f0bed1deef7da23d68e5691497f1ebcdb0e15203b0cb89af2ef"
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
