# Smart-Contract
This Solidity program is a simple "Smart-Contract" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.
## Description
pragma solidity ^0.8.0;

contract School {
    address public principal;
    mapping(address => bool) public teachers;
    uint256 public studentMarks;

    constructor() {
        principal = msg.sender;
    }
    modifier onlyPrincipal() {
        require(msg.sender == principal, "Only principal can perform this action.");
        _;
    } 
    modifier onlyTeacher() {
        require(teachers[msg.sender], "Only a registered teacher can perform this action.");
        _;
    }
    function addTeacher(address _teacher) public onlyPrincipal {
        teachers[_teacher] = true;
    }
    function removeTeacher(address _teacher) public onlyPrincipal {
        teachers[_teacher] = false;
    }

    function setStudentMarks(uint256 _marks) public onlyTeacher {
        require(_marks <= 100, "Marks can't be more than 100.");
        studentMarks = _marks;
    }
    function resetStudentMarks() public onlyPrincipal {
        studentMarks = 0;
    }
}
# Getting started 
## Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Contract.sol). Copy and paste the following code into that file.
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Contract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the school function. Click on the "School"contract in the left-hand sidebar, and then click on the "add teacher" function. Finally, click on the "transact" button to execute the function .
