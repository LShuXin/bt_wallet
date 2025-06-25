const { ethers } = require("hardhat");

async function main() {
  const address = "0xE6A8eeDDedd00848964be0d5D0e32EC254581F7e";
  const provider = ethers.provider;
  const balance = await provider.getBalance(address);
  console.log(`Address: ${address}`);
  console.log(`Balance: ${ethers.utils.formatEther(balance)} ETH`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
