function sk --wraps='ssh-keygen -R' --description 'alias sk=ssh-keygen -R'
  ssh-keygen -R $argv; 
end
