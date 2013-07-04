export PATH=$HOME/.bin:$PATH

git_prompt_info() {
  ref=$($(which git) symbolic-ref HEAD 2> /dev/null) || return
  user=$($(which git) config user.name 2> /dev/null)
  echo "(%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%})"
}

export PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%~%{$reset_color%} $(git_prompt_info) $ '
