//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";
import {DeployDSC} from "../../script/DeployDSC.s.sol";
import {DSCEngine} from "../../src/DSCEngine.sol";
import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
import {HelperConfig} from "../../script/HelperConfig.s.sol";
import {IERC20} from "forge-std/interfaces/IERC20.sol";
import {Handler} from "../fuzz/Handler.t.sol";

contract Invariant is Test {
    DeployDSC deployer;
    DSCEngine dsce;
    DecentralizedStableCoin dsc;
    HelperConfig config;
    Handler handler;
    address weth;
    address wbtc;

    function setUp() external {
        deployer = new DeployDSC();
        (dsc, dsce, config) = deployer.run();
        handler = new Handler(dsce, dsc);
        (,, weth, wbtc,) = config.activeNetworkConfig();
        targetContract(address(handler));
    }

    function invariant_protocolMustHaveMoreValueThanTotalSupply() public view {
        uint256 totalSupply = dsc.totalSupply();
        uint256 totalwethDeposited = IERC20(weth).balanceOf(address(dsce));
        uint256 totalBtcDeposited = IERC20(wbtc).balanceOf(address(dsce));

        uint256 wethValue = dsce.getUsdValue(weth, totalwethDeposited);
        uint256 wbtcValue = dsce.getUsdValue(wbtc, totalBtcDeposited);

        console.log("weth value: ", wethValue);
        console.log("wbtc value: ", wbtcValue);
        console.log("total supplu]y: ", totalSupply);

        assert(wethValue + wbtcValue >= totalSupply);
    }
}
