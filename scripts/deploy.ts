import { ethers } from "hardhat";

async function main() {

  const Main = await ethers.getContractFactory("Main");
  const main = await Main.deploy("testHackathon",);
  await main.deployed();

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
