class Webfox < Formula
  desc "Search the web, extract pages, get answers, and run research"
  homepage "https://github.com/mavam/webfox"
  url "https://registry.npmjs.org/webfox/-/webfox-4.4.2.tgz"
  sha256 "341bb5dff393205303ffa40f4ac6b5b6d4969dfde38c23544b9d7b92c4c458d5"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/web"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/web --version")

    config = testpath/"config.yaml"
    system bin/"web", "config", "default", "search", "brave", "--config", config
    assert_match "provider: brave", shell_output("#{bin}/web config show --config #{config}")
    system bin/"web", "config", "validate", "--config", config
    assert_match "BRAVE_SEARCH_API_KEY", shell_output("#{bin}/web providers brave --config #{config}")
  end
end
