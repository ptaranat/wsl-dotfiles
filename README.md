# WSL Dotfiles

Customizing my work environment brings me the same kind of joy like installing Skyrim mods.
I could spend days downloading stuff, making sure everything works together, but I still haven't beaten the main quest.
These are dotfiles for a mostly terminal-based environment, TUIs and CLIs over GUIs.
One day I will automate the setup using Nix.

## Prereqs on Windows Host

- Pengwin on MS Store - $9.99
  - Alternative: Debian WSL
- X410 X Server on MS Store - $9.99
  - Alternative: VcXsrv
- Windows Terminal
- Meslo Nerd Font patched for Powerlevel10k

## Windows Terminal

Currently using Preview for Quake mode.
```json
{
    "antialiasingMode": "grayscale",
    "backgroundImage": null,
    "bellStyle": "visual",
    "colorScheme": "MaterialDarker",
    "cursorShape": "vintage",
    "fontFace": "MesloLGS NF",
    "guid": "{7f586916-8357-53d4-bb2b-ca96f639898a}",
    "hidden": false,
    "name": "Pengwin",
    "source": "Windows.Terminal.Wsl",
    "startingDirectory": "\\\\wsl$\\WLinux\\home\\panat"
},
```

## pengwin-setup

- Editors
  - Neovim
- GUI
  - GUI Lib
  - High DPI
  - Synaptic package manager
  - X410
- Programming
  - C++
  - Go
  - Rust
  - Python with Pip
- Settings
  - Shells
    - zsh with oh-my-zsh
- Tools
  - Docker
    - Expose daemon in Docker Desktop
    - Change mount point from /mnt/c to /c

## Zsh setup

[https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)

### Plugins

Using `.zsh_plugins.txt` and [Znap plugin manager](https://github.com/marlonrichert/zsh-snap).
All the configuration is in the [.zshrc](/zsh/.zshrc) file.

### Plugins Manager

Znap manages cloning and sourcing plugin repositories.
My `.zshrc` is just a bunch of source statements.
Plus it works well with OMZ.
Care should be taken in the order of zsh-user plugins (competions, syntax-highlighting, history-substring-search, autosuggestions).

### Theme

Use `znap source powerlevel10k`. P10k's instant prompt is slightly faster so I am keeping that at the top.

## Tools

Most of them end up as [aliases](/zsh/.zsh/06-aliases.zsh).

- micro editor
  - `apt install micro`
- tealdeer: tldr man pages in rust
  - `cargo install tealdeer`
- exa: replacement for ls
  - `apt install exa`
- lazygit: git TUI
- ranger: file manager TUI
- bat: cat alternative
  - `apt install bat`
  - TODO check out bat-extras
- ripgrep: fast grep
- fd: fast find

### Other cool TUIs

- ticker: stock watcher
- bottom: activity monitor
- glow: markdown renderer
- mutt: email client
- weechat: IRC
- wttr.in: weather
- bit: git CLI autosuggestions
- navi: cheatsheets
- delta: diff viewer `cargo install git-delta`
