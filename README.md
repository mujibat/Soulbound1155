GameItems Smart Contract Documentation
Overview
The GameItems smart contract is an ERC-1155 token contract that facilitates the creation and management of in-game items. It is designed to work with a specific main token (identified by MAIN_TOKEN_ID) which represents ownership of certain privileges within the game. Each item token is minted and transferred in accordance with the ownership of the main token.

The contract extends the OpenZeppelin ERC-1155 implementation and includes additional functionality to control the ownership and transfer of item tokens based on the ownership of the main token.

Contract Details
Smart Contract Name: GameItems
License: MIT
Solidity Version: ^0.8.0
ERC Standard: ERC-1155
Ownership: Ownable (via OpenZeppelin's Ownable.sol)
Main Token
The main token has a constant ID (MAIN_TOKEN_ID) and is minted during contract deployment. Ownership of this main token is initially distributed to a set of provided initial owners. This main token acts as a prerequisite for the ownership of other item tokens.

Modifiers
onlyMainTokenOwner
A modifier that restricts the execution of a function to only the owner of the main token. It ensures that the caller owns the soulbound main token before allowing the function to proceed.

Constructor
constructor(address[] memory initialOwners)
Initializes the contract, mints the main token for the specified initial owners, and sets the URI for token metadata.
Requires at least two initial owners.
External Functions
ownsMainToken(address account) external view returns (bool)
Allows external callers to check if an address owns the soulbound main token.
mintItemTokens(address[] calldata accounts, uint256 id, uint256 amount, bytes memory data) external
Mints a specified amount of item tokens for multiple accounts.
Requires that each recipient owns the soulbound main token.
transferItemTokens(address from, address to, uint256 id, uint256 amount, bytes memory data) external onlyMainTokenOwner
Safely transfers a specified amount of item tokens from one address to another.
Requires that both the sender and receiver own the soulbound main token.
safeTransferFrom(address from, address to, uint256 id, uint256 amount, bytes memory data) public override
Overrides the ERC-1155 safeTransferFrom function to disallow the transfer of the main token.
Ensures that transfers involving the main token are explicitly prohibited.
Internal State
uint256 public constant MAIN_TOKEN_ID: The constant ID representing the soulbound main token.
mapping(address => bool) private _ownsMainToken: Mapping to track ownership of the main token.
Usage Recommendations
Deploy the contract with a minimum of two initial owners.
Use the mintItemTokens function to distribute item tokens to users who own the main token.
Utilize the transferItemTokens function to safely transfer item tokens between users who both own the main token.
URI Format
The URI for token metadata is set to "https://example.com/api/token/{id}.json". Developers should replace this URI with the appropriate endpoint for fetching token metadata.

License
This smart contract is released under the MIT License. Developers are encouraged to review and modify the contract according to their specific use cases while adhering to the terms of the license.

