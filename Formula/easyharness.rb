class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.0/easyharness_v0.5.0_darwin_arm64.zip"
      sha256 "21b4c2d532b91b48146419b9d564a221d4821b9ac7c9878d1b1c56e874ab94ea"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.0/easyharness_v0.5.0_darwin_amd64.zip"
      sha256 "7df72abc05763c38726002ea3dfbf76ef0bcb4234761281f43a657b14616f30d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.0/easyharness_v0.5.0_linux_arm64.zip"
      sha256 "132acd724c397648bfa6ded62236de4ac8e705f719181235af4335abd7cdbced"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.5.0/easyharness_v0.5.0_linux_amd64.zip"
      sha256 "70fa5a74a03184bfd3905ab78e7a2a4200b9028c8f1c9e355d944c4e8d364fa8"
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
