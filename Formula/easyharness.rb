class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.1.0-alpha.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.6/easyharness_v0.1.0-alpha.6_darwin_arm64.zip"
      sha256 "164a3d8967f32c6e8b2c4e53e42bb43f4e2c0b99e2b6c6bbda0a90ab7e2be104"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.6/easyharness_v0.1.0-alpha.6_darwin_amd64.zip"
      sha256 "85f8b5837f1e1fa188860b26e6c2cfab17f6cbd4d84ff0df0d4d5f4b51c3fccb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.6/easyharness_v0.1.0-alpha.6_linux_arm64.zip"
      sha256 "31a188d18fcb88e45cd3c6840b9bffb868989193435fed81260a971e81b31493"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.1.0-alpha.6/easyharness_v0.1.0-alpha.6_linux_amd64.zip"
      sha256 "c955a556db4aee9b3211992ef31d266ae1cd15090971643dd2e040d8d72e37a8"
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
