# QuaveOne CLI

Command-line interface for the [QuaveOne](https://quave.one/) platform.

## Installation

### Quick Install (Linux/macOS)

```bash
curl -fsSL https://raw.githubusercontent.com/quaveone/cli/main/install.sh | bash
```

### Manual Installation

Download the appropriate binary for your system from the [Releases](https://github.com/quaveone/cli/releases) page.

#### Available Binaries

| OS      | Architecture | File                              |
|---------|--------------|-----------------------------------|
| Linux   | x86_64       | `quaveone-{version}-linux-amd64`  |
| Linux   | ARM64        | `quaveone-{version}-linux-arm64`  |
| macOS   | x86_64       | `quaveone-{version}-darwin-amd64` |
| macOS   | ARM64 (M1+)  | `quaveone-{version}-darwin-arm64` |
| Windows | x86_64       | `quaveone-{version}-windows-amd64.exe` |
| Windows | ARM64        | `quaveone-{version}-windows-arm64.exe` |

After downloading, make the binary executable and move it to your PATH:

```bash
chmod +x quaveone-*
sudo mv quaveone-* /usr/local/bin/quaveone
```

## Usage

```bash
quaveone --help
```

## Requirements

- **curl** (for installation script)
- **Linux**, **macOS**, or **Windows**
- **amd64** or **arm64** architecture

## Uninstall

```bash
sudo rm /usr/local/bin/quaveone
```

## Links

- [QuaveOne Platform](https://quave.one/)
- [Releases](https://github.com/quaveone/cli/releases)
- [Issues](https://github.com/quaveone/cli/issues)
vi que estou 