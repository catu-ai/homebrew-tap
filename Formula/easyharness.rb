class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.0-rc.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.3/easyharness_v0.6.0-rc.3_darwin_arm64.zip"
      sha256 "02c0c0f7decf9db760dab8b679aaba8b8aef16172aa4b85b583c8e5e31dbed2c"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.3/easyharness_v0.6.0-rc.3_darwin_amd64.zip"
      sha256 "2959e4bd7e94dc11f07eb01ca323068a9378127770dd213a103a1914b13bd0bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.3/easyharness_v0.6.0-rc.3_linux_arm64.zip"
      sha256 "cab69239fa828a2cb2d1f05e49a23534522397b2660948a0d68ebe440d5fd955"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.3/easyharness_v0.6.0-rc.3_linux_amd64.zip"
      sha256 "0513a1906a942554e5d1d2d4557d5399db07dc4b0f8ac0563d5bf107de2b00c8"
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
