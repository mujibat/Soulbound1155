// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Soulbound.sol";

contract SoulboundScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Soulbound soulbound = new Soulbound(
            0xA003A9A2E305Ff215F29fC0b7b4E2bb5a8C2F3e1,
            0x82f2fBF5617F6D7AfE9AB0C6E5e65dB52D1fb563
        );

        vm.stopBroadcast();
    }
}

