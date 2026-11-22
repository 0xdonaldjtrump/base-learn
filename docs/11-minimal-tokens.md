# 11. Minimal Tokens – UnburnableToken

**Solution:** [`contracts/UnburnableToken.sol`](../contracts/UnburnableToken.sol)

## Task
Supply of 100,000,000, one claim of 1000 tokens per wallet (`TokensClaimed`, `AllTokensClaimed`) and `safeTransfer` that reverts with `UnsafeTransfer(to)` for the zero address or an address without Base Sepolia ETH.

## How the solution works
`_to.balance == 0` checks the ETH balance of the receiver.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
