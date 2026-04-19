class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.4/easyharness_v0.2.4_darwin_arm64.zip"
      sha256 "8c88625c339019ac5f7ae4b416ccf0bd7e4a1aff4637de73141970960139cb40"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.4/easyharness_v0.2.4_darwin_amd64.zip"
      sha256 "f7f52dadfba93f6a8fb0bd174223f969546c1c0428e9f64033f6ec259c989ba9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.4/easyharness_v0.2.4_linux_arm64.zip"
      sha256 "9f6f18bf7eb0729c855c910c6af5bbc2710d2734eb8cbef31ea9d443bf0a5e9d"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.4/easyharness_v0.2.4_linux_amd64.zip"
      sha256 "cfb2a3b758e88b969897062a4d93ba1ae046064cf884f05aff25b863ff755814"
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
