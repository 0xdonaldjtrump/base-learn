# 6. Structs – GarageManager

**Solution:** [`contracts/GarageManager.sol`](../contracts/GarageManager.sol)

## Task
A `Car` struct, a `garage` mapping of car arrays, add/get/update/reset functions and a `BadCarIndex(index)` error.

## How the solution works
Bounds-check the index before updating; `delete garage[msg.sender]` clears the whole array.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
