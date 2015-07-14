git_branch() {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}
relative_path() {
pwd|sed -e "s:$HOME:~:"| sed -re "s:([^/])[^/]+/:\1/:g"
}

#PS1="[\W]"
#PS1="\u@\H:[\$(relative_path)]"
#PS1+="\$(git_branch)"
#PS1+="\$"
#export PS1

bash_custom_ps() {
  PS1="[\W]"
  PS1="\u@\H:[\$(relative_path)]"
  PS1+="\[\e[0;31m\]\$(git_branch)\[\e[m\]" 
  PS1+="\$"
  export PS1
}
bash_custom_ps
