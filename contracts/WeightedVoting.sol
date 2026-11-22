// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract WeightedVoting is ERC20 {
    using EnumerableSet for EnumerableSet.AddressSet;

    uint public maxSupply = 1_000_000;

    error TokensClaimed();
    error AllTokensClaimed();
    error NoTokensHeld();
    error QuorumTooHigh(uint quorum);
    error AlreadyVoted();
    error VotingClosed();

    struct Issue {
        EnumerableSet.AddressSet voters;
        string issueDesc;
        uint votesFor;
        uint votesAgainst;
        uint votesAbstain;
        uint totalVotes;
        uint quorum;
        bool passed;
        bool closed;
    }

    struct IssueView {
        address[] voters;
        string issueDesc;
        uint votesFor;
        uint votesAgainst;
        uint votesAbstain;
        uint totalVotes;
        uint quorum;
        bool passed;
        bool closed;
    }

    enum Vote { AGAINST, FOR, ABSTAIN }

    Issue[] internal issues;
    mapping(address => bool) private claimed;

    constructor() ERC20("WeightedVoting", "WV") {
        issues.push(); // burn the zeroeth element
    }

    function claim() public {
        if (totalSupply() >= maxSupply) revert AllTokensClaimed();
        if (claimed[msg.sender]) revert TokensClaimed();
        claimed[msg.sender] = true;
        _mint(msg.sender, 100);
    }

    function createIssue(string calldata _issueDesc, uint _quorum) external returns (uint) {
        if (balanceOf(msg.sender) == 0) revert NoTokensHeld();
        if (_quorum > totalSupply()) revert QuorumTooHigh(_quorum);
        Issue storage issue = issues.push();
        issue.issueDesc = _issueDesc;
        issue.quorum = _quorum;
        return issues.length - 1;
    }

    function getIssue(uint _id) external view returns (IssueView memory) {
        Issue storage issue = issues[_id];
        return IssueView({
            voters: issue.voters.values(),
            issueDesc: issue.issueDesc,
            votesFor: issue.votesFor,
            votesAgainst: issue.votesAgainst,
            votesAbstain: issue.votesAbstain,
            totalVotes: issue.totalVotes,
            quorum: issue.quorum,
            passed: issue.passed,
            closed: issue.closed
        });
    }

    function vote(uint _issueId, Vote _vote) public {
        Issue storage issue = issues[_issueId];
        if (issue.closed) revert VotingClosed();
        if (issue.voters.contains(msg.sender)) revert AlreadyVoted();
        uint weight = balanceOf(msg.sender);
        if (weight == 0) revert NoTokensHeld();
        issue.voters.add(msg.sender);
        if (_vote == Vote.FOR) issue.votesFor += weight;
        else if (_vote == Vote.AGAINST) issue.votesAgainst += weight;
        else issue.votesAbstain += weight;
        issue.totalVotes += weight;
        if (issue.totalVotes >= issue.quorum) {
            issue.closed = true;
            if (issue.votesFor > issue.votesAgainst) issue.passed = true;
        }
    }
}
