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