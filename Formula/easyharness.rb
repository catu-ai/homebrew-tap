class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.1/easyharness_v0.5.1_darwin_arm64.zip"
      sha256 "8f39963e2ecb793ff9a7ab572fb1be77b1516f8a57388d97d063b76e64e03665"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.1/easyharness_v0.5.1_darwin_amd64.zip"
      sha256 "ab2e04a9f794e084278a14149a45c35911b3aef48b309b38888f7f2af64e242f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.1/easyharness_v0.5.1_linux_arm64.zip"
      sha256 "797c586862174ec715c72f80902ca281fac9e2d93d5e7225fc4c1af7cca543e0"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.1/easyharness_v0.5.1_linux_amd64.zip"
      sha256 "cb99de08673b97bcdf4d2b6b59e2104f5d968276f686ca8311627c374d1a94e1"
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
