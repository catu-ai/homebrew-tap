class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.0/easyharness_v0.3.0_darwin_arm64.zip"
      sha256 "05f0493b17cf24da5c95ec1c109c7c7f79b2d4bc5fc53e1037c92d33a1e8b89b"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.0/easyharness_v0.3.0_darwin_amd64.zip"
      sha256 "0dd182c95614c5e47089d0b341846c4b2c916639c79d063d5d788fa84e570503"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.0/easyharness_v0.3.0_linux_arm64.zip"
      sha256 "c653be81c3d492566fa6313a00f1015b317ac5edd208c16c1dbc94e9db30307a"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.3.0/easyharness_v0.3.0_linux_amd64.zip"
      sha256 "5e078088511cb08b0aff2d3d6d1e35cbceeaa2cb41ef05d72801fb4da916b0e6"
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
