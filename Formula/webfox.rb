class Webfox < Formula
  desc "Search the web, extract pages, get answers, and run research"
  homepage "https://github.com/mavam/webfox"
  url "https://registry.npmjs.org/webfox/-/webfox-4.5.0.tgz"
  sha256 "a5bed097b5b7ac9ed38e75e373757652b3c6e074750db87da35913115e5b5b74"
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
