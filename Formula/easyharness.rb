class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.1/easyharness_v0.2.1_darwin_arm64.zip"
      sha256 "27b164c4f6c42903f5caf39f2a8228075207426745757894f7679b2d44a5bb00"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.1/easyharness_v0.2.1_darwin_amd64.zip"
      sha256 "597c8e9061caa7ed902312c44532ed8bbd115faf17c3a8f16c929bca3d945553"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.1/easyharness_v0.2.1_linux_arm64.zip"
      sha256 "8ca876a4c968972fc64569ff5727353d0cf01ac4f9e43a4e7a3dde809996ca26"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.2.1/easyharness_v0.2.1_linux_amd64.zip"
      sha256 "d049f2c5e21ded58856f11d0515761c6847c95cb40727c703fa442f63ab5b9c6"
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
