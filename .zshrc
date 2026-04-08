# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/sudo"
plug "Aloxaf/fzf-tab"  # Then load fzf-tab
plug "zap-zsh/completions"
plug "romkatv/powerlevel10k"

# Load and initialise completion system
autoload -Uz compinit
compinit


#Alias
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first"
alias tree="eza --tree --icons"
alias Supdate='sudo pacman -Syu'
alias kittythemes='kitty +kitten themes'
alias sourcezsh='source .zshrc'
alias bangers='ncmpcpp'
alias install='sudo pacman -S'
alias weeb='ani-cli'
alias search='yay'
alias weather='curl wttr.in/Jacksonville FL'
alias remove='sudo pacman -R'
alias restartwaybar='hyprctl dispatch exec waybar'
alias yazikeys='bat /home/swav/Documents/yazi.md'
alias nirishot='bat --language=markdown ~/Documents/scripts/nirishotkeys.md'
alias ytmdl='/home/swav/Documents/scripts/ytaudio.sh'

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"

# ~/.zshrc

eval "$(starship init zsh)"

# PipX
export PATH="${PATH}:$(python3 -c 'import site; print(site.USER_BASE)')/bin"

#Cargo
export PATH="$HOME/.cargo/bin:$PATH"

#Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


#default terminal
export TERMINAL=kitty


export BEMOJI_PICKER_CMD="fuzzel -d"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
