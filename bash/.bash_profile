# General Settings

  # Enable fuzzy finder
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash

  # set default environment variables
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export BAT_THEME='Nord'
  export EDITOR='nvim'
  export WORMHOLE='~/Code/Subjects'

# Keybindings

  # bind -x '"": pushd ./ &> /dev/null && clear && dirs -l -v | tail -n +2 '
  # bind -x '"": popd &> /dev/null && clear && pwd && echo && dirs -l -v | tail -n +2'

# Aliases

  # Utility
  alias delete_swap_files="rm /Users/cyeoman/.local/share/nvim/swap/*"
  alias branches="git branch | rg '[*\s]' -r ''"
  alias gitgraph="clear && echo && git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all && echo"

  # Automation & External Programs
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  alias googleLint="java -jar ~/runnables/java-format.jar"
  alias tiler="for prog in {skhd,yabai}; do brew services start $prog; done"

  # Overide defaults
  alias tree="tree -C"
  alias subxargs="xargs -I '{}'"
  alias rgr="rg --passthru --no-line-number -pcre2"

  # QOL
  alias vm="ssh -p 3001 cyeoman@localhost"
  alias create="~/.config/scripts/create_file.sh"
  alias tls="clear && ~/.config/scripts/list_tree.sh"
  alias run="clear && ~/.config/scripts/compile.sh"
  alias configs="~/.config/scripts/configs.sh"
  alias crep="~/.config/scripts/colourise.sh"
  alias reload="source ~/.bash_profile"
  alias venv="source .venv/bin/activate"
  alias gvim="neovide"
  alias goto="source ~/.config/scripts/goto.sh"
  alias bookmark="~/Personal/reading/update.sh"

# Language Settings

  # setup nvm to manaage nodejs versioning

  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"
  [      -s "$NVM_DIR/nvm.sh"      ] && \. "$NVM_DIR/nvm.sh"

  # setup pyenv to mangage python versioning

  export PATH=/usr/local/opt/python@3.11/libexec/bin:$PATH
  export PYENV_ROOT="$HOME/.pyenv"

  # export SDKMAN_DIR="$HOME/.sdkman"
  # [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

##
# Your previous /Users/cyeoman/.bash_profile file was backed up as /Users/cyeoman/.bash_profile.macports-saved_2023-11-18_at_17:27:08
##

# MacPorts Installer addition on 2023-11-18_at_17:27:08: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

