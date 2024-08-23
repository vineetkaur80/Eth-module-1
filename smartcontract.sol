// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

contract AdminControl {
    address public admin;
    uint256 public adminData;


    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can call this function");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function changeAdmin(address newAdmin) public onlyAdmin {
        require(newAdmin != address(0), "New admin address cannot be zero");
        admin = newAdmin;
    }

    function setAdminData(uint256 _data) public onlyAdmin {
        adminData = _data;
    }

}
