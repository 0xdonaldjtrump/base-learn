# 2. Control Structures

**Solution:** [`contracts/ControlStructures.sol`](../contracts/ControlStructures.sol)

## Task
`fizzBuzz` returns Fizz / Buzz / FizzBuzz / Splat. `doNotDisturb` panics (`assert`) for ≥2400, reverts with custom error `AfterHours(time)` outside 800–2200, reverts with `"At lunch!"` for 1200–1259, otherwise returns Morning!/Afternoon!/Evening!

## How the solution works
Check divisibility by 15 first. Use `assert` to trigger a panic, a custom error for after hours and a string revert for lunch.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
