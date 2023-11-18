-- configuration for neovim

require "user.config.options"
require "user.config.plugins"
require "user.config.appearance"
require "user.config.keybindings"
require "user.config.dependencies"

-- setup other QOL utilities

require "user.utilities.notify"
require "user.utilities.project"
require "user.utilities.comments"
require "user.utilities.alignment"
require "user.utilities.treesitter"

-- customisation the interface

require "user.interface.tab-line"
require "user.interface.git"
require "user.interface.terminal"
require "user.interface.status-line"
require "user.interface.fuzzy-finder"
require "user.interface.welcome"
require "user.interface.file-explorer"

-- setup language servers

require "user.lsp-config.init"

--- core editing essentials

require "user.core.operations"
require "user.core.autopair"
require "user.core.motions"
require "user.core.autocomplete"
require "user.core.text-objects"
