set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8

set -xg PYTHONDONTWRITEBYTECODE 1

set LOCAL_FISH $OMF_CONFIG/local.fish
if test -f $LOCAL_FISH
  source $LOCAL_FISH
end
