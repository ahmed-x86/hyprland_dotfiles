# ─── Meta ───────────────────────────────────────────────────────
# Created by Phunt_Vieg_
# Ensure running interactively
[[ $- != *i* ]] && return

# ─── History ─────────────────────────────────────────────────────
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory

# ─── Keybinds ────────────────────────────────────────────────────
bindkey -e

# ─── FZF ─────────────────────────────────────────────────────────
eval "$(fzf --zsh)"
# FZF theme catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#313244,label:#CDD6F4"
export FZF_TAB_COLORS='fg:#CDD6F4,bg:#1E1E2E,hl:#F38BA8,min-height=5'

# ─── Zinit ───────────────────────────────────────────────────────
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${ZDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# ─── Completion ──────────────────────────────────────────────────
autoload -Uz compinit && compinit
zinit cdreplay -q

# Completion styling
zstyle ':completion:*' matcher-list 'm:{A-Za-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:*' fzf-flags --height=17
zstyle ':fzf-tab:complete:*' fzf-preview '
if [ -d "$realpath" ]; then
    eza --icons --tree --level=2 --color=always "$realpath"
elif [ -f "$realpath" ]; then
    bat -n --color=always --line-range :500 "$realpath"
fi
'

# ─── Aliases ─────────────────────────────────────────────────────
alias ls='eza --icons --color=always'
alias ll='eza --icons --color=always -l'
alias la='eza --icons --color=always -a'
alias lla='eza --icons --color=always -la'
alias lt='eza --icons --color=always -a --tree --level=1'
alias grep='grep --color=always'
alias vim='nvim'
alias lzg='lazygit'
alias lzd='lazydocker'
alias cbonsai='cbonsai -l -i -w 1'

# ─── Wine GE Custom Aliases ──────────────────────────────────────
alias wine-ge='/opt/wine-ge-custom-opt/bin/wine'
alias wine64-ge='/opt/wine-ge-custom-opt/bin/wine64'
alias winecfg-ge='/opt/wine-ge-custom-opt/bin/winecfg'
alias wineboot-ge='/opt/wine-ge-custom-opt/bin/wineboot'
alias winepath-ge='/opt/wine-ge-custom-opt/bin/winepath'
alias wineserver-ge='/opt/wine-ge-custom-opt/bin/wineserver'
alias wineconsole-ge='/opt/wine-ge-custom-opt/bin/wineconsole'
alias winefile-ge='/opt/wine-ge-custom-opt/bin/winefile'
alias winemine-ge='/opt/wine-ge-custom-opt/bin/winemine'
alias regedit-ge='/opt/wine-ge-custom-opt/bin/regedit'
alias regsvr32-ge='/opt/wine-ge-custom-opt/bin/regsvr32'
alias msiexec-ge='/opt/wine-ge-custom-opt/bin/msiexec'
alias notepad-ge='/opt/wine-ge-custom-opt/bin/notepad'

# ─── Tools Init ──────────────────────────────────────────────────
# Setup bat (better than cat)
export BAT_THEME="base16"
alias bat='bat --paging=never'

# Setup zoxide (better than cd)
eval "$(zoxide init zsh)"


# Pokemon startup
pokemon-colorscripts --no-title -s -r

# Initialize Oh-My-Posh
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/catppuccin.omp.json)"
# --yazi -------------------------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export PATH="$HOME/.local/bin:$PATH"
