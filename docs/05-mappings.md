# 5. Mappings – FavoriteRecords

**Solution:** [`contracts/FavoriteRecords.sol`](../contracts/FavoriteRecords.sol)

## Task
Approved albums mapping, per-user favorites, `NotApproved(name)` custom error, list getters and a reset.

## How the solution works
Mappings can't be iterated, so the contract also keeps arrays of approved names and of each user's favorites.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
