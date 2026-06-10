class Easyharness < Formula
  desc "Thin, git-native harness CLI for human-steered, agent-executed work"
  homepage "https://github.com/catu-ai/easyharness"
  license "MIT"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.3/easyharness_v0.4.3_darwin_arm64.zip"
      sha256 "6d62bef50c510818ba62c5e9a2924ff4ece0a3390797fd991baaec99c370ba59"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.3/easyharness_v0.4.3_darwin_amd64.zip"
      sha256 "cff988c249723093f0d28ea2acb3654607e797557195fd7c74a64bf79b84668c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.3/easyharness_v0.4.3_linux_arm64.zip"
      sha256 "9d3a45d0f85095bb6f84ccdc527ea6a82f6abb849b14e75cbf2f831b3f2828c6"
    else
      url "https://github.com/catu-ai/easyharness/releases/download/v0.4.3/easyharness_v0.4.3_linux_amd64.zip"
      sha256 "c797bdf3087898af0b375497e43f102d365ece56eb33307e518363c36e6d3ce3"
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
