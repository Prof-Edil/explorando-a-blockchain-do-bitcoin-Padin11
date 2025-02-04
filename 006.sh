# Which tx in block 257,343 spends the coinbase output of block 256,128?
coinbase=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 256128) | jq -r '.tx[0]')

bitcoin-cli getblock $(bitcoin-cli getblockhash 257343) | jq -r '.tx[]' | while read TXID; do
    bitcoin-cli getrawtransaction "$TXID" true | jq -e ".vin[] | select(.txid == \"$coinbase\")" && echo "$TXID" && break
done
