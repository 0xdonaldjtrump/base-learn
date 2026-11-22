# 3. Storage – EmployeeStorage

**Solution:** [`contracts/EmployeeStorage.sol`](../contracts/EmployeeStorage.sol)

## Task
Store shares, name, salary and idNumber with **storage packing**; grant shares with a `TooManyShares` custom error and a `"Too many shares"` string revert. Deploy with `1000, "Pat", 50000, 112358132134`.

## How the solution works
`uint16 shares` and `uint32 salary` share one storage slot – the unit test reads raw slots with `checkForPacking`.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
