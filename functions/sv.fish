function sv --wraps='ssh -v' --description 'alias sv ssh -v'
  ssh -v $argv; 
end
