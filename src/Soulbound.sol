// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../lib/solmate/src/tokens/ERC1155.sol";

contract GameItems is ERC1155 {
    uint256 public constant MAIN_TOKEN_ID = 1;
    mapping(address => bool) private _ownsMainToken;
    mapping(address => mapping(uint256 => uint256)) private _balances;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    modifier onlyMainTokenOwner() {
        require(_ownsMainToken[msg.sender], "Caller does not own the soulbound main token");
        _;
    }

    constructor(address[] memory initialOwners) ERC1155() {
        require(initialOwners.length >= 2, "At least two initial owners are required");

        for (uint256 i = 0; i < initialOwners.length; i++) {
            _mint(initialOwners[i], MAIN_TOKEN_ID, 1, "");
            _ownsMainToken[initialOwners[i]] = true;
        }
    }

    function ownsMainToken(address account) external view returns (bool) {
        return _ownsMainToken[account];
    }

    function mintItemTokens(address[] calldata accounts, uint256 id, uint256 amount, bytes memory data) external {
        for (uint256 i = 0; i < accounts.length; i++) {
            address account = accounts[i];
            require(_ownsMainToken[account], "Recipient does not own the soulbound main token");
            _mint(account, id, amount, data);
        }
    }

    function transferItemTokens(address from, address to, uint256 id, uint256 amount, bytes calldata data)
        external
        onlyMainTokenOwner
    {
        require(_ownsMainToken[from] && _ownsMainToken[to], "Both sender and receiver must own the soulbound main token");
        safeTransferFrom(from, to, id, amount, data);
    }

    
}
