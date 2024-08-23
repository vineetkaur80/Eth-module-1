# Smart-Contract
This Solidity program is a simple "Smart-Contract" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.
## Description
```
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
```
# Getting started 
## Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Contract.sol). Copy and paste the following code into that file.
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Contract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the school function. Click on the "School"contract in the left-hand sidebar, and then click on the "add teacher" function. Finally, click on the "transact" button to execute the function .
# Authors
Contributed by name : Vineet Kaur
Email ID : kaurvineet80@gmail.com
# License
This project is licensed under the MIT License - see the LICENSE.md file for details
