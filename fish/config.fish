function _git_branch_name
  echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
	echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function show_cwd -d "Function to show the current working directory"
  set_color -o cyan
	echo -n (pwd | rg '(?:.*/)?(.[A-z0-9]+)$' -r '$1 ')
  set_color normal
end

function show_git_info -d "Show git branch and dirty state"
  if [ (_git_branch_name) ]
    set -l git_branch '['(_git_branch_name)']'

    set_color -o
    if [ (_is_git_dirty) ]
      set_color -o red
      echo -n "$git_branch× "
    else
      set_color -o green
      echo -n "$git_branch "
    end
    set_color normal
  end
end

function fish_prompt
  # set fish_greeting

  show_cwd
  show_git_info
end

function fish_greeting
	clear
	logo
	printf '\n\n'
end
