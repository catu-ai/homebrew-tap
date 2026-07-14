class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.0-rc.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.1/easyharness_v0.6.0-rc.1_darwin_arm64.zip"
      sha256 "ef491d09f636e6e3922578464b052c66d918bc29b28425fd02bdaa38adb369ad"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.1/easyharness_v0.6.0-rc.1_darwin_amd64.zip"
      sha256 "192329e7d1ed97fcf6dcd35cc41f2e0e33a1870be5b5278aab73882b768c6411"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.1/easyharness_v0.6.0-rc.1_linux_arm64.zip"
      sha256 "d6c2912735b32caea5599fb3748d430c8410727e9b085b2b5f21cce9a7253eae"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.1/easyharness_v0.6.0-rc.1_linux_amd64.zip"
      sha256 "4edb953bf07f5243e7fa97872979d969260765e7f230bfb5b5ca2111f4af29c3"
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
