const main = async () => {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying MyNFT with account:", deployer.address);

  const NFT = await ethers.getContractFactory("BTNFT");
  const nft = await NFT.deploy();

  await nft.waitForDeployment();
  console.log("MyNFT deployed to:", await nft.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
