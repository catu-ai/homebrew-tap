class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.0/easyharness_v0.4.0_darwin_arm64.zip"
      sha256 "e57fd3e2d3af1fab3eb2ef1556f199c13d11de340fa1b30e684aa7ea0d3bb7c7"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.0/easyharness_v0.4.0_darwin_amd64.zip"
      sha256 "b7d65265868ca18e0915dbcf491179b4b5eae6283b288c0736c16a10f8341ddd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.0/easyharness_v0.4.0_linux_arm64.zip"
      sha256 "2c9f585bdb0be1996dabd835b54ed9a9c62319176368cbab66e703736209b442"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.0/easyharness_v0.4.0_linux_amd64.zip"
      sha256 "fb5759266176bdcbde8abfddff4ed5b7fea8524d56d5ea45329d1d9110982642"
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
