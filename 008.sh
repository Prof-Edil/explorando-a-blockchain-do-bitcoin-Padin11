# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
tx="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
chave=$(bitcoin-cli getrawtransaction "$tx" true | jq -r '.vin[0].txinwitness[1]')
  echo "${chave:4:66}"
