# Hardhat Usage example

## Topics

- contract writing
- contract test
- contract complie (obtain abi)
- contract deployment (test net)

## DeployContract

```agsl
npx hardhat run deployments/deploy-token.js --network <network>
npx hardhat run deployments/deploy-did.js --network <network>
npx hardhat run deployments/deploy-nft.js --network <network>

```

## tools

### generate a random private key**

```shell
apples-Mac-mini-1243:project1 apple$ node tools/generate-wallet.js
address: 0x81098fE62756b9b7F4FA5c343516883b60589aF8
private key: 0x...
```

### check balance

```shell
apples-Mac-mini-1243:project1 apple$ npx hardhat run tools/checkBalance.js --network Sepolia
Address: 0xE6A8eeDDedd00848964be0d5D0e32EC254581F7e
Balance: 0.05 ETH
```
