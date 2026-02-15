# dotfiles

Personal configuration files.

## Configurations

### Zsh (`.zshrc`)

Shell configuration for Zsh. Sets NeoVim as the default editor, configures Oh My Posh for the prompt theme, and loads plugins for autosuggestions, syntax highlighting, and completions. Integrates zoxide for smart directory navigation, fzf for fuzzy finding, and bat with the Tokyo Night theme. Manages PATH entries for pnpm, nvm, Go, and uv.

### Aliases (`.aliases`)

Custom shell aliases. Uses [eza](https://github.com/eza-community/eza) as a replacement for `ls` with icons and color output, shortcuts for [chezmoi](https://www.chezmoi.io/), and [thefuck](https://github.com/nvbn/thefuck) for command correction.

### Fzf (`.fzf`)

Configuration for [fzf](https://github.com/junegunn/fzf), the command-line fuzzy finder. Uses [fd](https://github.com/sharkdp/fd) as the default search backend, sets up a custom color theme, and configures preview windows with eza (directories) and bat (files) for `Ctrl+T`, `Alt+C`, and tab completion.

### Tmux (`.tmux.conf`)

Configuration for [tmux](https://github.com/tmux/tmux), the terminal multiplexer. Remaps split keys to `|` and `-`, enables vi-style copy mode and mouse support, and reduces escape time for NeoVim compatibility. Plugins include vim-tmux-navigator for seamless pane/split navigation, tmux-resurrect and tmux-continuum for session persistence, and the Tokyo Night theme.

### WezTerm (`.wezterm.lua`)

Configuration for [WezTerm](https://wezfurlong.org/wezterm/), a GPU-accelerated terminal emulator. Sets CodeNewRoman Nerd Font Mono at size 16, enables a semi-transparent window with macOS background blur, removes title bar decorations, and applies a custom "coolnight" color scheme.

### NeoVim (`.config/nvim/`)

Full NeoVim configuration written in Lua with [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. Organized into core settings (options, keymaps, autocommands) and modular plugin configs. Key features include:

- **LSP** -- Mason, nvim-lspconfig, lspsaga, and typescript-tools for language server management and UI.
- **Completion** -- nvim-cmp with LuaSnip, buffer, path, and LSP sources.
- **Syntax** -- Treesitter for highlighting, indentation, incremental selection, and folding.
- **Formatting & Linting** -- conform.nvim (prettier, stylua, ruff, isort) and nvim-lint (eslint_d, ruff, mypy).
- **Navigation** -- fzf-lua for fuzzy finding, neo-tree for the file explorer, arrow.nvim for bookmarks, and snipe.nvim for buffer switching.
- **Git** -- gitsigns, lazygit integration, and vim-fugitive.
- **UI** -- nightfox colorscheme, lualine statusline, tabby tabline, noice.nvim for command UI, nvim-notify for notifications, alpha-nvim dashboard, which-key for keybinding hints, and dropbar for breadcrumbs.
- **Editing** -- nvim-autopairs, nvim-surround, Comment.nvim, mini.nvim (indentscope, move), and todo-comments.

### LazyGit (`.config/lazygit/config.yml`)

Configuration for [LazyGit](https://github.com/jesseduffield/lazygit), a terminal UI for Git. Enables Nerd Fonts v3 icons, opens files in NeoVim, and defines a custom commit workflow with gitmoji support -- interactive prompts for commit type (feat, fix, refactor, etc.), emoji selection, scope, message, body, and breaking change footer following the Conventional Commits format.

### Oh My Posh (`.config/ohmyposh/`)

Prompt theme configurations for [Oh My Posh](https://ohmyposh.dev/). Contains two themes:

- **`marcduiker.toml`** (active) -- A multi-line powerline-style prompt showing user/session, current directory, git status with branch/staging/working indicators, an exit status diamond, right-aligned Node/Go/Python version and execution time, and a clock.
- **`base.toml`** -- An alternative multi-line theme with an OS icon, user@host, git status, full path breadcrumbs, execution time, clock, Python virtualenv, and a red arrow prompt.

## Structure

```
.
├── .aliases                        # Shell aliases
├── .config/
│   ├── lazygit/
│   │   └── config.yml              # LazyGit config with gitmoji workflow
│   ├── nvim/
│   │   ├── init.lua                # NeoVim entry point
│   │   ├── lazy-lock.json          # Plugin lock file (chezmoi-managed)
│   │   └── lua/config/
│   │       ├── core/               # Options, keymaps, autocommands
│   │       ├── lazy.lua            # lazy.nvim bootstrap
│   │       └── plugins/            # Plugin configurations
│   │           └── lsp/            # LSP-specific plugin configs
│   └── ohmyposh/
│       ├── base.toml               # Alternative prompt theme
│       └── marcduiker.toml         # Active prompt theme
├── .fzf                            # Fzf configuration
├── .tmux.conf                      # Tmux configuration
├── .wezterm.lua                    # WezTerm terminal config
└── .zshrc                          # Zsh shell configuration
```
