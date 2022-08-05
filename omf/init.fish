set -xg PYTHONDONTWRITEBYTECODE 1

set LOCAL_FISH $OMF_CONFIG/local.fish
if test -f $LOCAL_FISH
  source $LOCAL_FISH
end
