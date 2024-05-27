import requests

etherscan_url = "https://api.etherscan.io/api?module=proxy&action=eth_blockNumber&apikey=YourApiKeyToken"
blockcypher_url = "https://api.blockcypher.com/v1/eth/main"

response_etherscan = requests.get(etherscan_url)
response_blockcypher = requests.get(blockcypher_url)

data_etherscan = response_etherscan.json()["result"]
data2_blockcypher= response_blockcypher.json()["height"]

data_etherscan_decimal = int(data_etherscan, 16)


if data_etherscan_decimal == data2_blockcypher:
    print(f"Values ​​are equal: result = {data_etherscan_decimal}, height = {data2_blockcypher}")
else:
    print(f"Values ​​aren't equal result = {data_etherscan_decimal}, height = {data2_blockcypher}")
