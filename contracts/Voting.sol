// contracts/Voting.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint voteCount;
    }

    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor(string[] memory candidateNames) {
        owner = msg.sender;
        for (uint i = 0; i < candidateNames.length; i++) {
            candidates.push(Candidate({
                name: candidateNames[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint candidateIndex) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[candidateIndex].voteCount += 1;
    }

    function getCandidate(uint index) public view returns (string memory, uint) {
        require(index < candidates.length, "Invalid index");
        return (candidates[index].name, candidates[index].voteCount);
    }

    function totalCandidates() public view returns (uint) {
        return candidates.length;
    }
}
