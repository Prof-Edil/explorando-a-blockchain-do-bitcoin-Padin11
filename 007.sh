# Only one single output remains unspent from block 123,321. What address was it sent to?


hash=$(bitcoin-cli getblockhash 123321)
bitcoin-cli getblock "$hash" | jq -r '.tx[]' | while read -r txid; do
  bitcoin-cli getrawtransaction "$txid" true | jq -c '.vout[]' | while read -r vout; do
    index=$(jq -r '.n' <<< "$vout")
    bitcoin-cli gettxout "$txid" "$index" | jq -er '.scriptPubKey.address' && exit 0
  done
done
