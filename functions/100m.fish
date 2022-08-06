function 100m --argument target
  if echo $target | grep -q ^https
    set args "--no-check-certificate"
  end
  wget $args -O /dev/null $target/100mb.bin
end
