# How many new outputs were created by block 123,456
blockhash=$(bitcoin-cli getblockhash 123456)
txid=$(bitcoin-cli getblock "$blockhash" | jq -r '.tx[]')

total_outputs=0
for txid1 in $txid; do
    outputs=$(bitcoin-cli getrawtransaction "$txid1" true | jq '.vout | length')
    total_outputs=$((total_outputs + outputs))
done

echo "Outputs: $total_outputs"
