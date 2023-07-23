# Immediately set beam cursor
echo -ne '\e[5 q'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10kip="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$p10kip" ]] && source "$p10kip"

source $HOME/.p10k.zsh
source ${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.zsh

async-init() {
    # Make autosuggestions work
    [ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
        export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)

    source $HOME/.posixrc
    source $HOME/.fzf.zsh

    # File types to open with vim without prefixing their path with vim
    alias -s {md,txt,json,cs,csv,cpp,h,vim,py,zsh,sh}=vim
    alias git='noglob git'

    setopt auto_cd
    setopt auto_pushd
    setopt pushd_ignore_dups
    setopt pushdtohome
    setopt pushdsilent
    setopt pushdminus
    setopt hist_ignore_dups
    setopt hist_ignore_space
    setopt share_history

    # Zle widgets
    zle -N vi-yank
    zle -N zle-line-init
    zle -N zle-keymap-select
    zle -N accept-line
    zle -N yank-to-clipboard
    zle -N up-directory

    bindkey -v
    bindkey -M vicmd '^Y' yank-to-clipboard
    bindkey -M visual '^Y' yank-to-clipboard
    bindkey -M vicmd '^?' up-directory
    bindkey '^ ' forward-word
}

# Set beam cursor e.g. after exiting from vim
zle-line-init() {
    echo -ne '\e[5 q'
}

# Change cursor for vi mode
zle-keymap-select() {
   if [ $KEYMAP = vicmd ]; then
        # Set block cursor
        echo -ne '\e[1 q'
    else
        # Set beam cursor
        echo -ne '\e[5 q'
    fi
}

# Execute command when enter is pressed on an empty line
accept-line() {
    if [[ -z "$BUFFER" && "$CONTEXT" == start ]]; then
        zle fzf-file-widget
    fi
    zle .accept-line
}

up-directory() {
    cd ..
    local precmd
    for precmd in $precmd_functions; do
        $precmd
    done
    zle reset-prompt
}

# highlight yanked text
vi-yank() {
    zle .vi-yank
    local rest=${BUFFER#*$CUTBUFFER}
    local ende=$(( ${#BUFFER} - ${#rest} ))
    local start=$(( $ende - ${#CUTBUFFER} ))
    region_highlight=("$start $ende standout")
}

yank-to-clipboard() {
    zle vi-yank
    echo "$CUTBUFFER" | clip.exe
}

# execute the last command again and insert output into command line
redo() { print -z "$(fc -s -- -1)" }

zinit light romkatv/powerlevel10k
zinit wait lucid light-mode for \
    atload"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
    atinit"async-init" \
    atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    ver"gcfb" \
    d4ku/forgit \
    kazhala/dotbare \
    peterhurford/git-it-on.zsh
