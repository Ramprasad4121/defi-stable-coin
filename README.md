# DeFi Stable Coin

<!-- <div align="center">
  <a href="https://github.com/Ramprasad4121/defi-stable-coin">
    <img src="docs/images/defi-banner.png" alt="DeFi Stable Coin Banner" width="600" height="300">
  </a>
</div> -->

<div align="center">
  Collateralized Decentralized Stablecoin (DSC) System
  <br />
  <a href="#about"><strong>Explore the demo »</strong></a>
  <br />
  <br />
  <a href="https://github.com/Ramprasad4121/defi-stable-coin/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/Ramprasad4121/defi-stable-coin/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
  ·
  <a href="https://github.com/Ramprasad4121/defi-stable-coin/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+">Ask a Question</a>
</div>

<div align="center">
<br />

[![Solidity](https://img.shields.io/badge/Solidity-^0.8.20-blue)](https://soliditylang.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-green)](LICENSE)

</div>

<details open="open">
<summary>Table of Contents</summary>

- [DeFi Stable Coin](#defi-stable-coin)
  - [About](#about)
    - [Built With](#built-with)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Usage](#usage)
    - [Local Development](#local-development)
    - [Testnet (Sepolia)](#testnet-sepolia)
    - [Interactions](#interactions)
    - [Testing](#testing)
    - [Other Commands](#other-commands)
  - [Roadmap](#roadmap)
  - [Support](#support)
  - [Project Assistance](#project-assistance)
  - [Contributing](#contributing)
  - [Authors \& Contributors](#authors--contributors)
  - [Security](#security)
  - [License](#license)
  - [Acknowledgements](#acknowledgements)

</details>

---

## About

A decentralized stablecoin (DSC) protocol backed by over-collateralized assets like WETH. Users deposit collateral to mint DSC, with liquidation mechanisms for stability. Built with Foundry for robust testing (unit, fuzzing) and easy deployment to local or Sepolia testnet.

Why this? To showcase DeFi primitives: collateral management, minting/burning, and security via Slither analysis.

<!-- <details>
<summary>Screenshots</summary>
<br>

|                               Local Deployment Console                               |                               Mint DSC Transaction                               |
| :-------------------------------------------------------------------: | :--------------------------------------------------------------------: |
| <img src="docs/images/deploy-local.png" title="Anvil Deployment" width="100%"> | <img src="docs/images/mint-dsc.png" title="Mint Transaction" width="100%"> |

> Add screenshots of `make deploy` and `cast` mint command.

</details> -->

### Built With

- [Foundry](https://book.getfoundry.sh/) – Forge, Cast, Anvil
- Solidity ^0.8.20
- [Slither](https://github.com/crytic/slither) – Static analysis
- [Make](https://www.gnu.org/software/make/) – Automation

## Getting Started

### Prerequisites

- Git (`git --version`)
- Foundry (`curl -L https://foundry.paradigm.xyz | bash && foundryup`; `forge --version`)

### Installation

1. Clone:
   ```bash
   git clone https://github.com/Ramprasad4121/defi-stable-coin.git
   cd defi-stable-coin
   ```

2. Build:
   ```bash
   forge build
   ```

3. Setup `.env` from `.env.example`: Add `SEPOLIA_RPC_URL` (Alchemy), `PRIVATE_KEY` (test only), `ETHERSCAN_API_KEY` (optional).

## Usage

### Local Development

- Start Anvil:
  ```bash
  make anvil
  ```

- Deploy:
  ```bash
  make deploy
  ```

### Testnet (Sepolia)

1. Fund: [Chainlink Faucet](https://faucets.chain.link/).
2. Deploy:
   ```bash
   make deploy ARGS="--network sepolia"
   ```

### Interactions

- Deposit WETH:
  ```bash
  cast send 0x091EA0838eBD5b7ddA2F2A641B068d6D59639b98 "depositCollateral()" --value 0.1ether --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
  ```

- Approve & Mint DSC:
  ```bash
  cast send <DSC_ADDRESS> "approve(address,uint256)" <MINTER> <AMOUNT> --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
  cast send 0x091EA0838eBD5b7ddA2F2A641B068d6D59639b98 "mintDsc(uint256)" <AMOUNT> --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_RPC_URL
  ```

### Testing

- Unit & Fuzz:
  ```bash
  forge test
  ```

- Coverage:
  ```bash
  forge coverage --report lcov
  ```

### Other Commands

- Format: `forge fmt`
- Gas snapshot: `forge snapshot`
- Slither: `slither . --config-file slither.config.json`
- Clean: `make clean`

## Roadmap

[Open issues](https://github.com/Ramprasad4121/defi-stable-coin/issues).

- Enhancements: Liquidation auctions, oracles
- Bugs: Vote with 👍

Future: Mainnet deployment, frontend.

## Support

- [Issues](https://github.com/Ramprasad4121/defi-stable-coin/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+)
- [X](https://x.com/0xramprasad)

## Project Assistance

- ⭐ [Star](https://github.com/Ramprasad4121/defi-stable-coin)
- Tweet: "#DeFi #Stablecoin Foundry"
- Blog: [Dev.to](https://dev.to/)

## Contributing

Fork, branch (`git checkout -b feature/xyz`), commit, PR. See [CONTRIBUTING.md](docs/CONTRIBUTING.md).

## Authors & Contributors

- [Ramprasad4121](https://github.com/Ramprasad4121)

[Contributors](https://github.com/Ramprasad4121/defi-stable-coin/contributors)

## Security

Slither-analyzed; audit before prod. Report: [SECURITY.md](docs/SECURITY.md). "As is."

## License

MIT License. See [LICENSE](LICENSE).

## Acknowledgements

- [Foundry](https://getfoundry.sh/) – Dev toolkit
- Ethereum DeFi community.