# 4. Arrays – ArraysExercise

**Solution:** [`contracts/ArraysExercise.sol`](../contracts/ArraysExercise.sol)

## Task
Return the full `numbers` array, reset it to 1–10, append a calldata array, save sender/timestamp pairs and filter timestamps after Y2K (`946702800`).

## How the solution works
Resetting with an array literal assignment avoids 10 separate `push` calls. Filtering is done in two passes: count, then fill fixed-size memory arrays.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
