# 10. The new Keyword – AddressBookFactory

**Solution:** [`contracts/AddressBookFactory.sol`](../contracts/AddressBookFactory.sol)

## Task
An `Ownable` `AddressBook` (add/delete/get contacts, `ContactNotFound(id)`) and a factory whose `deploy()` creates a book owned by the caller.

## How the solution works
With OpenZeppelin 5 `Ownable` takes the initial owner in its constructor, so the factory passes `msg.sender`.

## Submit
Deploy on **Base Sepolia** and call `testContract(<your contract>)` on the unit-test contract listed in the [README](../README.md) – or just use the helper page: https://0xdonaldjtrump.github.io/base-learn/
