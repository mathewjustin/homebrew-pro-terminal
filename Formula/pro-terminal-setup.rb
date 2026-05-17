class ProTerminalSetup < Formula
  desc "Portable Ghostty/zsh terminal setup with Kubernetes and tmux helpers"
  homepage "https://github.com/mathewjustin/pro-terminal-setup"
  url "https://github.com/mathewjustin/pro-terminal-setup/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "482edecad6e1a7d962fb93061c0014b022c9516f42ae6e4622475d3fca79933a"
  license "MIT"

  depends_on "starship"
  depends_on "zoxide"
  depends_on "eza"
  depends_on "bat"
  depends_on "fd"
  depends_on "ripgrep"
  depends_on "fzf"
  depends_on "jq"
  depends_on "yq"
  depends_on "zsh"
  depends_on "kubectl"
  depends_on "k9s"
  depends_on "tmux"
  depends_on "lazygit"

  def install
    libexec.install Dir["*"]
    (bin/"pro-terminal-setup").write <<~EOS
      #!/bin/sh
      export PRO_TERMINAL_PREFIX="#{libexec}"
      exec "#{libexec}/bin/pro-terminal-setup" "$@"
    EOS
  end

  def caveats
    <<~EOS
      To apply the setup:
        pro-terminal-setup install

      Then open a new terminal and run:
        terminal-intro

      Ghostty itself is a separate app. On macOS you can install it with:
        brew install --cask ghostty
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/pro-terminal-setup nope 2>&1", 2)
  end
end
