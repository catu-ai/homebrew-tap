class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.6.0-rc.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.4/easyharness_v0.6.0-rc.4_darwin_arm64.zip"
      sha256 "c15ba923cf69acc4db8c5147286d5d164e901546a484a0660c0de8b582636933"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.4/easyharness_v0.6.0-rc.4_darwin_amd64.zip"
      sha256 "1f9ce3d25b11d839ec9e1f7223b91fb5339e4f819b12b49f7a015158331a88ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.4/easyharness_v0.6.0-rc.4_linux_arm64.zip"
      sha256 "812be846a9423d603ac0b1300eae65d5bc1e7cb3216dbc67b0aaca3a755374af"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.6.0-rc.4/easyharness_v0.6.0-rc.4_linux_amd64.zip"
      sha256 "52f54252ea9cee083a8808f85ebf86cad3d7d88a34717409d80df86ba245bd38"
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
