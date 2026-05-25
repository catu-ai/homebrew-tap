class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.1/easyharness_v0.3.1_darwin_arm64.zip"
      sha256 "f2fa07fee432590613356c764f6a3ba3de0c649594827223298c343bc889c30c"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.1/easyharness_v0.3.1_darwin_amd64.zip"
      sha256 "950e4bfb63b82e7674b72d1643d0039df986798ab70dff77f786d58a4113aef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.1/easyharness_v0.3.1_linux_arm64.zip"
      sha256 "7d172146e4c1e5d656f85ae5917a3d9345a86908653312a99555eea9e248048f"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.1/easyharness_v0.3.1_linux_amd64.zip"
      sha256 "0dd6d4f9b0de6a497a5538ee8deb3b6a0b8a42c654d2640ab5c22c8de853b3a2"
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
