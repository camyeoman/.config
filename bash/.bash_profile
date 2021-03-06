# Program Settings

	# Enable fuzzy finder
	[ -f ~/.fzf.bash ] && source ~/.fzf.bash

	# Set default editor to nvim
	export EDITOR='nvim'

	# rust cargo path
	export PATH="$HOME/.cargo/bin:$PATH"

# Aliases

	# Utility
	alias delete_swap_files="rm /Users/cyeoman/.local/share/nvim/swap/*"
	alias branches="git branch | rg '[*\s]' -r ''"

	# Automation & External Programs
	alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
	alias googleLint="java -jar ~/runnables/java-format.jar"
	alias tiler="~/.config/scripts/tiling.sh"

	# Overide defaults
	alias tree="tree -C"

	# QOL
	alias createJava="~/.resources/bash_scripts/createJava.sh"
	alias tls="clear && ~/.config/scripts/list_tree.sh"
	alias run="clear && ~/.config/scripts/compile.sh"
	alias configs="~/.config/scripts/configs.sh"

# Language Settings

	# Python

	# setup pyenv for version management
	if command -v pyenv 1>/dev/null 2>&1; then
		eval "$(pyenv init -)"
	fi

	# QOL alias for python3
	alias py='/usr/local/bin/python3'

	# Java

	# SDKMAN manages different versions of java

	export SDKMAN_DIR="/Users/cyeoman/.sdkman"
	[[ -s "/Users/cyeoman/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/cyeoman/.sdkman/bin/sdkman-init.sh"
