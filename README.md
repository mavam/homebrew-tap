# 🍺 Mavam’s Homebrew tap

Install command-line tools by [Matthias Vallentin](https://github.com/mavam)
with [Homebrew](https://brew.sh).

## 🚀 Installation

Install a formula directly:

```sh
brew install mavam/tap/webfox
```

Or add the tap first to use short formula names:

```sh
brew tap mavam/tap
brew install webfox
```

## 🧰 Available tools

| Formula | Command | Description |
| --- | --- | --- |
| [webfox](https://github.com/mavam/webfox) | `web` | Search the web, extract pages, get answers, and run research. |

Homebrew installs Node.js and the dependencies for the `web` command. Run
`web --help` to get started, or see the [Webfox documentation](https://github.com/mavam/webfox#readme)
for providers, API keys, and configuration.

### Use Webfox with Pi

Homebrew installs the terminal command, not the Pi extension. Install the
extension separately:

```sh
pi install npm:webfox
```

Both installations use the same Webfox configuration. Installing the Pi
extension alone doesn't put `web` on your shell’s `PATH`.

## ⬆️ Updates

```sh
brew update
brew upgrade webfox
```

The tap checks for new releases daily and opens update pull requests. Updates
become available after those pull requests are merged. Update the Pi extension
separately through Pi.

## 🧹 Uninstall

```sh
brew uninstall webfox
brew untap mavam/tap
```

## 📄 License

[MIT](LICENSE). Packaged tools retain their own licenses.
