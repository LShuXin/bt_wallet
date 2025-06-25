// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract DIDRegistry {
    struct DIDDocument {
        string name;
        string publicKey;
        string metadata;
    }

    mapping(address => DIDDocument) public didDocuments;

    event DIDRegistered(address indexed owner, string name, string publicKey, string metadata);
    event DIDUpdated(address indexed owner, string name, string publicKey, string metadata);

    function registerDID(string memory name, string memory publicKey, string memory metadata) external {
        require(bytes(didDocuments[msg.sender].publicKey).length == 0, "DID already registered");
        didDocuments[msg.sender] = DIDDocument(name, publicKey, metadata);
        emit DIDRegistered(msg.sender, name, publicKey, metadata);
    }

    function updateDID(string memory name, string memory publicKey, string memory metadata) external {
        require(bytes(didDocuments[msg.sender].publicKey).length > 0, "DID not found");
        didDocuments[msg.sender] = DIDDocument(name, publicKey, metadata);
        emit DIDUpdated(msg.sender, name, publicKey, metadata);
    }

    function getDID(address user) external view returns (DIDDocument memory) {
        return didDocuments[user];
    }
}
