class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.5/easyharness_v0.2.5_darwin_arm64.zip"
      sha256 "280526cc826e1cb9ccf23c1a881df7a1f55288025e76ebb37adc2f895789f978"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.5/easyharness_v0.2.5_darwin_amd64.zip"
      sha256 "a5970f5f1851cb43a9b1407317a0451a432c7538e3e2fdedf0764047571c03f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.5/easyharness_v0.2.5_linux_arm64.zip"
      sha256 "7774269a872e1e58fbe4d68ee711eee469026cde6a135ba6735d42f6ba3006b2"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.5/easyharness_v0.2.5_linux_amd64.zip"
      sha256 "d1ef15d97f612f0434c6f64accd15d9a93283b5299d77ccbc0565b2d68b61c9a"
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
