//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DSCEngine} from "../src/DSCEngine.sol";
import {DecentralizedStableCoin} from "../src/DecentralizedStableCoin.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployDSC is Script {
    function run() external returns (DecentralizedStableCoin, DSCEngine, HelperConfig) {
        address[] memory tokenaddresses;
        address[] memory priceFeedAddresses;

        HelperConfig config = new HelperConfig();

        (address wethUsdPriceFeed, address wbtcUsdPriceFeed, address weth, address wbtc, uint256 deployerKey) =
            config.activeNetworkConfig();

        tokenaddresses = new address[](2);
        tokenaddresses[0] = weth;
        tokenaddresses[1] = wbtc;
        priceFeedAddresses = new address[](2);
        priceFeedAddresses[0] = wethUsdPriceFeed;
        priceFeedAddresses[1] = wbtcUsdPriceFeed;

        vm.startBroadcast(deployerKey);
        DecentralizedStableCoin dsc = new DecentralizedStableCoin();
        DSCEngine engine = new DSCEngine(tokenaddresses, priceFeedAddresses, address(dsc));

        dsc.transferOwnership(address(engine));
        vm.stopBroadcast();
        return (dsc, engine, config);
    }
}
