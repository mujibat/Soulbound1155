# GameItems Smart Contract

## Overview

The `GameItems` smart contract is an ERC-1155 token contract designed for managing in-game items. It leverages the OpenZeppelin ERC-1155 implementation and introduces additional functionality to control item token ownership based on the ownership of a main token.

## Table of Contents

- [Contract Details](#contract-details)
- [Main Token](#main-token)
- [Modifiers](#modifiers)
- [Constructor](#constructor)
- [External Functions](#external-functions)
- [Internal State](#internal-state)
- [Usage Recommendations](#usage-recommendations)
- [URI Format](#uri-format)
- [License](#license)

## Contract Details

- **Smart Contract Name**: GameItems
- **License**: MIT
- **Solidity Version**: ^0.8.0
- **ERC Standard**: ERC-1155
- **Ownership**: Ownable (via OpenZeppelin's Ownable.sol)

## Main Token

The main token has a constant ID (`MAIN_TOKEN_ID`) and is minted during contract deployment. Ownership of this main token is initially distributed to a set of provided initial owners. This main token acts as a prerequisite for the ownership of other item tokens.

## Modifiers

### `onlyMainTokenOwner`

A modifier that restricts the execution of a function to only the owner of the main token. It ensures that the caller owns the soulbound main token before allowing the function to proceed.

## Constructor

### `constructor(address[] memory initialOwners)`

- Initializes the contract, mints the main token for the specified initial owners, and sets the URI for token metadata.
- Requires at least two initial owners.

## External Functions

### `ownsMainToken(address account) external view returns (bool)`

- Allows external callers to check if an address owns the soulbound main token.

### `mintItemTokens(address[] calldata accounts, uint256 id, uint256 amount, bytes memory data) external`

- Mints a specified amount of item tokens for multiple accounts.
- Requires that each recipient owns the soulbound main token.

### `transferItemTokens(address from, address to, uint256 id, uint256 amount, bytes memory data) external onlyMainTokenOwner`

- Safely transfers a specified amount of item tokens from one address to another.
- Requires that both the sender and receiver own the soulbound main token.

### `safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override`

- Overrides the ERC-1155 `safeTransferFrom` function to disallow the transfer of the main token.
- Ensures that transfers involving the main token are explicitly prohibited.

## Internal State

- `uint256 public constant MAIN_TOKEN_ID`: The constant ID representing the soulbound main token.
- `mapping(address => bool) private _ownsMainToken`: Mapping to track ownership of the main token.

## Usage Recommendations

1. Deploy the contract with a minimum of two initial owners.
2. Use the `mintItemTokens` function to distribute item tokens to users who own the main token.
3. Utilize the `transferItemTokens` function to safely transfer item tokens between users who both own the main token.

## URI Format

The URI for token metadata is set to "https://example.com/api/token/{id}.json". Developers should replace this URI with the appropriate endpoint for fetching token metadata.

## License

This smart contract is released under the MIT License. Developers are encouraged to review and modify the contract according to their specific use cases while adhering to the terms of the license.

**Note**: This documentation assumes familiarity with ERC-1155 and OpenZeppelin contracts. Developers are advised to thoroughly test the contract in a suitable environment before deploying it in a production setting.
# GameItems Smart Contract

...

## Deployment

The `GameItems` smart contract has been deployed at the following address:

- **Contract Address**: [0x54541B223847927fBBA78D689f9bEe4b9fB7bb09](https://etherscan.io/address/0x54541B223847927fBBA78D689f9bEe4b9fB7bb09)

Feel free to interact with the contract on the Ethereum blockchain using the provided contract address.

...

