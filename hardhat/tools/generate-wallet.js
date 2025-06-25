/*
 * @Author: simon.liu.lsx@gmail.com
 * @Date: 2025-06-17 12:40:40
 * @LastEditors: simon.liu.lsx@gmail.com
 * @LastEditTime: 2025-06-17 16:42:31
 * @FilePath: /project1/tools/generate-wallet.js
 * @Description: 
 * 
 * Copyright (c) 2025 by simon.liu.lsx@gmail.com, All Rights Reserved. 
 */
const { Wallet } = require('ethers');
const wallet = Wallet.createRandom();

console.log("address:", wallet.address);
console.log("private key:", wallet.privateKey);
