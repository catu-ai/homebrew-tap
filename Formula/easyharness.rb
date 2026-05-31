class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.1/easyharness_v0.4.1_darwin_arm64.zip"
      sha256 "08363ec6b40e9c756001579ddc55d36a7f96f728300c7555f5e8685f3a40d300"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.1/easyharness_v0.4.1_darwin_amd64.zip"
      sha256 "a639ede0ccb1403bb8f653fdc06c7247c9a3e6edd6c5b66b306bca050c2eb34b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.1/easyharness_v0.4.1_linux_arm64.zip"
      sha256 "a5a5fcaa756994235a6be4fdde5281a369cc57870ad61d3a96390f35054249a1"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.1/easyharness_v0.4.1_linux_amd64.zip"
      sha256 "a9281dbdc706808770eaa583c35a6e0d7938c79791d9ca4bfa6a82da8c7a4053"
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
