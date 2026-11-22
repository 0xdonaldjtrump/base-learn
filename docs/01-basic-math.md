# 1. Deploying to a Testnet – BasicMath

**Solution:** [`contracts/BasicMath.sol`](../contracts/BasicMath.sol)

## Task
`adder` and `subtractor` return `(result, error)`. Overflow/underflow must not revert: return `(0, true)` instead.

## How the solution works
Use an `unchecked` block for addition and compare the result with an input to detect overflow; for subtraction just check `_b > _a` first.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
