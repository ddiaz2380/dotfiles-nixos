if status is-interactive
    # Commands to run in interactive sessions can go here
end



# vi mode
fish_vi_key_bindings

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# nvim 🦾
if type -q nvim
  set -gx EDITOR 'nvim -u NONE'
  set -gx VISUAL nvim
  set -gx MANPAGER "nvim +Man! -c ':set signcolumn='"
  
  alias n='nvim '
#   alias nl='nvim -u ~/.config/nvimlua/init.lua '
  alias vimdiff="nvim -d"
  alias ncf="nvim $XDG_CONFIG_HOME/fish/config.fish"
  alias ncn="nvim $XDG_CONFIG_HOME/nvim/init.vim"
  alias ncx="nvim $HOME/System/nixos-config/"
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND