// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "../src/Soulbound.sol";
import "./Helpers.sol";

contract SoulboundTest is Helpers {
    Soulbound soulbound;

    address _userA;
    address _userB;

    uint256 _privKeyA;
    uint256 _privKeyB;

    function setUp() public {
        soulbound = new soulbound(["_userA", "_userB"]);
        (_userA, _privKeyA) = mkaddr("USERA");
        (_userB, _privKeyB) = mkaddr("USERB");
    }

    function testOwnsMainToken() external {
        vm.prank(_userA);
        soulbound.ownsMainToken(_userA);
    }

    function testRequireOwnsMainTokens() external {
      vm.startPrank(address(0x1111));
      vm.expectRevert("Recipient does not own the soulbound main token"); 
      soulbound.mintItemTokens(["0x1111", "0x2222"]);
    }

    function testMintItemTokens() external {
        vm.startPrank(_userA);
        soulbound.mintItemTokens(["_userA", "_userB"]);
    }

    
    function testTransferItemTokens() external {
        vm.prank(address(0x1111));
        vm.expectRevert("Both sender and receiver must own the soulbound main token");
        soulbound.transferItemTokens(address(0x1111), address(0x2222), 2, 2, "0x");
    }
}