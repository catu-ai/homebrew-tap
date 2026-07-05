class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.5.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.2/easyharness_v0.5.2_darwin_arm64.zip"
      sha256 "4a15576d3d79eb41b54ac1a1805a2243ac8f4dcb969acfcf265f2ea576f0e063"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.2/easyharness_v0.5.2_darwin_amd64.zip"
      sha256 "eee53d2926a2cb00b102b324a77632afe99649be7f4c241c0fc1307be5cb7cc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.2/easyharness_v0.5.2_linux_arm64.zip"
      sha256 "1e4a46a7db9c11dd66721c633c80ccd61a791fc254b9a4cb27e51877fe9222ff"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.2/easyharness_v0.5.2_linux_amd64.zip"
      sha256 "8cd3090cdfe478e848c9655154bf458b5ad08142e952b49974d5e8fbc5aea613"
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
