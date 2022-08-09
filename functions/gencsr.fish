function gencsr --argument domain
  if set -q argv[1]
    mkdir -p {$domain}
    openssl req -out {$domain}.csr -new -newkey rsa:2048 -nodes -keyout {$domain}.key -sha256
  else
    echo "FQDN required!"
    return 2
  end
end
