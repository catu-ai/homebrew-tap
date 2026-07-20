class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.1/easyharness_v0.6.1_darwin_arm64.zip"
      sha256 "7b18caadaa9ccbecaba4b99a222baa74b7edd22d0623b0b90ee5b8f21bb473df"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.1/easyharness_v0.6.1_darwin_amd64.zip"
      sha256 "cd786ebef4215b16a52027fc07a0bb0097f27b3b92f12b7cb1f4b9d62194c4c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.1/easyharness_v0.6.1_linux_arm64.zip"
      sha256 "7a9136fe7a8e7de065eaeb71503ff6cb41c0a0a82e1965e771debba1e5b3e991"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.1/easyharness_v0.6.1_linux_amd64.zip"
      sha256 "2ee1e588672468f5a85816b2e45752e17c148257407b6913905bf9c4947f72f9"
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
