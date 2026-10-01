class Webfox < Formula
  desc "Search the web, extract pages, get answers, and run research"
  homepage "https://github.com/mavam/webfox"
  url "https://registry.npmjs.org/webfox/-/webfox-4.6.0.tgz"
  sha256 "b6214b46d88f7a7688db6ee36a92e54c3ba52816b830ce623f7c73404fd6e212"
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
