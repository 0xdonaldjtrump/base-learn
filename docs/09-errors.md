# 9. Errors – ErrorTriageExercise

**Solution:** [`contracts/ErrorTriageExercise.sol`](../contracts/ErrorTriageExercise.sol)

## Task
Fix the starter contract: absolute differences, applying a signed modifier to an unsigned base and popping with a return value.

## How the solution works
Compare before subtracting to avoid underflow; convert the `int` modifier safely; read the last element *before* `pop()`.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
