# 8. Imports – ImportsExercise

**Solution:** [`contracts/ImportsExercise.sol`](../contracts/ImportsExercise.sol)

## Task
Import `SillyStringUtils`, store a `Haiku`, return it as a struct and return a copy with 🤷 added to line 3 without changing storage.

## How the solution works
Copy the struct to `memory` before modifying it so the stored haiku stays untouched.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
