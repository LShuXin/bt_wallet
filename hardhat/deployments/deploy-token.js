/*
 * @Author: simon.liu.lsx@gmail.com
 * @Date: 2025-06-17 12:52:12
 * @LastEditors: simon.liu.lsx@gmail.com
 * @LastEditTime: 2025-06-17 16:42:17
 * @FilePath: /project1/deployments/deployToken.js
 * @Description: 
 * 
 * Copyright (c) 2025 by simon.liu.lsx@gmail.com, All Rights Reserved. 
 */
const main = async () => {
    const initialSupply = ethers.utils.parseEther("100000");

    const [deployer] = await ethers.getSigners();
    console.log(`Address deploying the contract --> ${deployer.address}`);

    const tokenFactory = await ethers.getContractFactory("Token");
    const contract = await tokenFactory.deploy(initialSupply);

    console.log(`Token contract address --> ${contract.address}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
