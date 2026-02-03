# Quave One CLI

Command-line interface for the [QuaveOne](https://www.quave.one/) platform.

📖 **[Full Documentation](https://docs.quave.one/cli/)**

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/quaveone/cli/main/install.sh | bash
```

### Options

The installer supports environment variables for customization:

| Variable | Description | Default |
|----------|-------------|---------|
| `QUAVEONE_VERSION` | Specific version to install | Latest |
| `QUAVEONE_INSTALL_DIR` | Custom installation directory | `~/.local/bin` or `/usr/local/bin` |

#### Examples

```bash
# Install specific version
QUAVEONE_VERSION=1.0.28 bash -c "$(curl -fsSL https://raw.githubusercontent.com/quaveone/cli/main/install.sh)"

# Install to custom directory
QUAVEONE_INSTALL_DIR=./bin bash -c "$(curl -fsSL https://raw.githubusercontent.com/quaveone/cli/main/install.sh)"

# Combine options
QUAVEONE_VERSION=1.0.25 QUAVEONE_INSTALL_DIR=/opt/bin bash -c "$(curl -fsSL https://raw.githubusercontent.com/quaveone/cli/main/install.sh)"
```

### Manual Installation

Download the appropriate binary for your system from the [Releases](https://github.com/quaveone/cli/releases) page.

#### Available Binaries

| OS      | Architecture | File                                   |
|---------|--------------|----------------------------------------|
| Linux   | x86_64       | `quaveone-{version}-linux-amd64`       |
| Linux   | ARM64        | `quaveone-{version}-linux-arm64`       |
| macOS   | x86_64       | `quaveone-{version}-darwin-amd64`      |
| macOS   | ARM64 (M1+)  | `quaveone-{version}-darwin-arm64`      |
| Windows | x86_64       | `quaveone-{version}-windows-amd64.exe` |
| Windows | ARM64        | `quaveone-{version}-windows-arm64.exe` |

```bash
# Download and install (example for Linux amd64)
curl -sL https://github.com/quaveone/cli/releases/latest/download/quaveone-1.0.28-linux-amd64 -o quaveone
chmod +x quaveone
mv quaveone ~/.local/bin/
```

> **Note:** Ensure `~/.local/bin` is in your PATH. Add `export PATH="$PATH:$HOME/.local/bin"` to your shell profile if needed.

## Usage

```bash
quaveone --help
```

## Requirements

- **Linux**, **macOS**, or **Windows**
- **amd64** or **arm64** architecture

## Uninstall

```bash
# If installed in ~/.local/bin
rm ~/.local/bin/quaveone

# If installed in /usr/local/bin
sudo rm /usr/local/bin/quaveone
```

## Links

- [Documentation](https://docs.quave.one/cli/)
- [QuaveOne Platform](https://www.quave.one/)
- [Releases](https://github.com/quaveone/cli/releases)
- [Issues](https://github.com/quaveone/cli/issues)
