const hre = require("hardhat");

const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("COntract deployed to:", nftContract.address);

  let txn = await nftContract.makeAnEpicNFT();
  await txn.wait();
  console.log("Minted NFT #1");

  txn = await nftContract.makeAnEpicNFT();
  await txn.wait();
  console.log("Minted NFT #2");
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  }catch(error) {
    console.log(error);
    process.exit(1);
  }
};
runMain();