# homebrew-pro-terminal

Homebrew tap for `pro-terminal-setup`.

## Install

```sh
brew tap mathewjustin/pro-terminal
brew install pro-terminal-setup
pro-terminal-setup install
```

Then open a new terminal and run:

```sh
terminal-intro
```

## What It Installs

The formula depends on:

- `starship`
- `zoxide`
- `eza`
- `bat`
- `fd`
- `ripgrep`
- `fzf`
- `kubectl`
- `k9s`
- `tmux`

It installs a `pro-terminal-setup` command that copies the portable configs
into your home directory and appends a source line to `~/.zshrc`.

## Publish Notes

Create a source repo named `pro-terminal-setup` containing the files from
`~/pro-terminal-setup-src`, tag it as `v0.1.0`, and create a GitHub release.

Then update `Formula/pro-terminal-setup.rb`:

```ruby
homepage "https://github.com/mathewjustin/pro-terminal-setup"
url "https://github.com/mathewjustin/pro-terminal-setup/archive/refs/tags/v0.1.0.tar.gz"
```

Recompute checksum after the final archive is published:

```sh
brew fetch --build-from-source ./Formula/pro-terminal-setup.rb
```
