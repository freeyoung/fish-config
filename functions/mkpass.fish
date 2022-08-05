function mkpass --argument length
  set -q argv[1]; or set length 32
  cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c "$length"
end
