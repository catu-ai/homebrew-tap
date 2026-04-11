class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.0/easyharness_v0.2.0_darwin_arm64.zip"
      sha256 "376111952f9872b7fd4a2a36027b1afb903de58c53bb427917b8f4489c1d0efc"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.0/easyharness_v0.2.0_darwin_amd64.zip"
      sha256 "45bfb8142de1cedfc645d40264f7c9e3c674b6778bc5f3a6f4aa2d0f5927be71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.0/easyharness_v0.2.0_linux_arm64.zip"
      sha256 "7c93bc3d7c76d4dfa6ab9d16ce2c61961837c1bf8201043171eab86e8e7116f1"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.0/easyharness_v0.2.0_linux_amd64.zip"
      sha256 "181cfabc9352531167345851de618307074bb3ab46821e19ac3a99e41fd4f3e6"
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
