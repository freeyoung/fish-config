function svr --wraps='ssh -v -l root' --description 'alias svr ssh -v -l root'
  ssh -v -l root $argv; 
end
