function open-pr --argument target
  set -q argv[1]; or set target "master"

  set upstream "$(git config --get remote.upstream.url)"
  set origin "$(git config --get remote.origin.url)"
  set branch "$(git_branch_name)"
  set repo "$(echo "$(git config --get remote.origin.url)" | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/")"
  set pr_url "https://github.com/$repo/pull/new"

  if test -z "$upstream"
    set url "$pr_url/$target...$branch"
  else
    set origin_name "$(echo $repo | cut -f1 -d'/')"
    set upstream_name "$(echo $upstream | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/")"
    set url "$pr_url/$upstream_name:$target...$origin_name:$branch"
  end

  if [ $(uname -s) = "Darwin" ]
    open $url
  else
    xdg-open $url
  end
end
