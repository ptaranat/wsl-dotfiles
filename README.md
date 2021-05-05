# pengwin-dotfiles

Config for my Pengwin WSL environment. After breaking it for the 4th time I decided I should document it, maybe automate it later.

## Prereqs on Windows Host

- Pengwin on MS Store - $9.99
  - Alternative: Debian WSL
- X410 X Server on MS Store - $9.99
  - Alternative: VcXsrv
- Windows Terminal
- Meslo Nerd Font patched for Powerlevel10k

## Windows Terminal

```json
{
  "guid": "{7f586916-8357-53d4-bb2b-ca96f639898a}",
  "hidden": false,
  "name": "Pengwin",
  "source": "Windows.Terminal.Wsl",
  "fontFace": "MesloLGS NF",
  "colorScheme": "MaterialDarker",
  "commandline": "wsl.exe ~"
}
```

### Shortcuts

- New vertical pane: Alt Shift =
- New horizontal pane: Alt Shift -
- New pane: Alt Shift D
- Switch pane: Alt Arrow
- Resize pane: Alt Shift Arrow
- Close pane: Ctrl Shift W

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

### Plugins

Using `.zsh_plugins.txt` and ~~Antibody for managing.~~  
Antibody was deprecated so now I am using znap, which is pure zsh script. All the configuration is in the `.zshrc`, including the list of plugins and their

### Plugins Manager

Znap is currently working the best. It is simply a way to manage cloning and sourcing plugin repositories. My `.zshrc` is just a bunch of clone and source statements. Plus it works well with OMZ. Care should be taken in the order of zsh-user plugins (competions, syntax-highlighting, history-substring-search, autosuggestions).

### Theme

`znap clone git@github.com:romkatv/powerlevel10k.git` then `znap prompt powerlevel10k`. P10k's instant prompt is slightly faster so I am keeping that at the top.

## Tools

### Frequently Used

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
- glow markdown
- mutt: email client
- weechat: IRC
- wttr.in: weather
- bit: git CLI autosuggestions
- navi: cheatsheets
- delta: diff viewer `cargo install git-delta`
