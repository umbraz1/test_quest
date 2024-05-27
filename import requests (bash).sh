#!/bin/bash

result_etherscan=$(curl -s "https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken" | jq -r '.result')
result=$((16#$ result_etherscan))

height=$(curl -s "https://api.blockcypher.com/v1/eth/main" | jq -r '.height')

if [ "$result" -eq "$height" ]; then
    echo "Values are equal"
else
    echo "Values aren't equal"
fi
