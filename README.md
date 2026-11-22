# Base Learn — all 13 exercises (Base Sepolia) 🎓📌

Solutions for the **13 Base Learn Solidity exercises** plus a **one-click page** that deploys each solution on **Base Sepolia** and submits it to the **official onchain unit-test contracts** to earn the soulbound **Base Learn NFT pins** — the ones checked by the Guild.xyz Base roles (Newcomer, Acolyte, Consul, Prefect, Supreme).

👉 **Open the helper: https://0xdonaldjtrump.github.io/base-learn/**

| # | Exercise | Contract | Unit test (Base Sepolia) |
|---|---|---|---|
| 1 | Deploying to a Testnet | `BasicMath` | `0x075eB9Dc52177Aa3492E1D26f0fDE3d729625d2F` |
| 2 | Control Structures | `ControlStructures` | `0xF4D953A3976F392aA5509612DEfF395983f22a84` |
| 3 | Storage | `EmployeeStorage` (1000, "Pat", 50000, 112358132134) | `0x567452C6638c0D2D9778C20a3D59749FDCaa7aB3` |
| 4 | Arrays | `ArraysExercise` | `0x5B0F80cA6f5bD60Cc3b64F0377f336B2B2A56CdF` |
| 5 | Mappings | `FavoriteRecords` | `0xD32E3ACe3272e2037003Ca54CA7E5676f9b8D06C` |
| 6 | Structs | `GarageManager` | `0x9eB1Fa4cD9bd29ca2C8e72217a642811c1F6176d` |
| 7 | Inheritance | `Salesperson` + `EngineeringManager` → `InheritanceSubmission` | `0xF90dA05e77a33Fe6D64bc2Df84e7dd0069A2111C` |
| 8 | Imports | `ImportsExercise` + `SillyStringUtils` | `0x8dD188Ec36084D59948F90213AFCd04429E33c0c` |
| 9 | Errors | `ErrorTriageExercise` | `0xC1BD0d9A8863f2318001BC5024c7f5F58a2236F7` |
| 10 | The "new" Keyword | `AddressBookFactory` + `AddressBook` (OpenZeppelin Ownable) | `0x4f21e69d0CDE8C21cF82a6b37Dda5444716AFA46` |
| 11 | Minimal Tokens | `UnburnableToken` | `0x10Ce928030E136EcC74d4a4416Db9b533e3c694D` |
| 12 | ERC-20 Tokens | `WeightedVoting` (OpenZeppelin ERC20 + EnumerableSet) | `0x4F333c49B820013e5E6Fe86634DC4Da88039CE50` |
| 13 | ERC-721 Tokens | `HaikuNFT` (OpenZeppelin ERC721) | `0x15534ED3d1dBA55148695B2Ba4164F147E47a10c` |

## How it works
1. Get a little free Base Sepolia test ETH from a faucet.
2. Open the helper page, connect your wallet (it switches to Base Sepolia).
3. Press **Deploy & submit all missing** — for each exercise your wallet deploys the contract and calls `testContract(address)` on the official unit test. Passing tests mint the pin to your wallet.

Compiled with Solidity 0.8.24, optimizer 200 runs, OpenZeppelin Contracts 5.1. Base Learn docs are archived, but the unit-test contracts are still live on Base Sepolia.

Not affiliated with Base or Coinbase. Testnet only.

**Keywords:** base learn, base learn pins, base sepolia, solidity exercises, guild.xyz base roles, onchain builder, web3 developer.
