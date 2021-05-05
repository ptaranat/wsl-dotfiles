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

Using `.zsh_plugins.txt` and Antibody for managing.

### Plugins Manager

Haven't decided yet. Leaning towards Antibody, Zgen, or Zplugin based on [bechmarks](https://gist.github.com/laggardkernel/4a4c4986ccdcaf47b91e8227f9868ded). Currently testing Antibody (requires uninstalling omz).

I install antibody first and use static loading:

```bash
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
antibody update
```

Then I install OMZ. Source omz has to be before source antibody plugins.

### Theme

Add `romkatv/powerlevel10k` to my `~/.zsh_plugins.txt`.

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
