class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.2/easyharness_v0.4.2_darwin_arm64.zip"
      sha256 "607eb2f6be63642eeb0620bbdc83da351d3b372b4e6a25971fe87bd4b7a14946"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.2/easyharness_v0.4.2_darwin_amd64.zip"
      sha256 "9adde77d432aba44b255b003b0b86fa375ea7291154c84f137c6483980b70b87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.2/easyharness_v0.4.2_linux_arm64.zip"
      sha256 "564b6e415c70dbb2185827e523562a215b2bdd2a48a98f9ad7b094e763da940c"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.2/easyharness_v0.4.2_linux_amd64.zip"
      sha256 "48a315e524417a5594d45be85b36544b05c7b2e3f30e0655f5f70f3042640950"
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
