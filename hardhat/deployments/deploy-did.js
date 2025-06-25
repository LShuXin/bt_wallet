const main = async () => {
  const [deployer] = await ethers.getSigners();
  console.log("Deploying DIDRegistry with account:", deployer.address);

  const DID = await ethers.getContractFactory("DIDRegistry");
  const did = await DID.deploy();

  await did.waitForDeployment();
  console.log("DIDRegistry deployed to:", await did.getAddress());
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });

