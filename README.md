# Smart-Contract
This Solidity program is a simple "Smart-Contract" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to serve as a starting point for those who are new to Solidity and want to get a feel for how it works.
## Description
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalStore {
    address public owner;

    struct Item {
        string name;
        uint price;
        uint stock;
    }

    mapping(uint => Item) public items;
    uint public itemCount;

    event ItemPurchased(uint itemId, string itemName, uint quantity, address buyer);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the store owner can perform this action.");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addItem(string memory _name, uint _price, uint _stock) public onlyOwner {
        require(_price > 0, "Price must be greater than 0.");
        require(_stock > 0, "Stock must be greater than 0.");
        
        items[itemCount] = Item(_name, _price, _stock);
        itemCount++;
    }

    function updateItem(uint _itemId, uint _price, uint _stock) public onlyOwner {
        require(_itemId < itemCount, "Item does not exist.");
        require(_price > 0, "Price must be greater than 0.");
        require(_stock >= 0, "Stock cannot be negative.");
        
        items[_itemId].price = _price;
        items[_itemId].stock = _stock;
    }

    function buyItem(uint _itemId, uint _quantity) public payable {
        require(_itemId < itemCount, "Item does not exist.");
        
        Item storage item = items[_itemId];
     
        require(item.stock >= _quantity, "Not enough stock available.");
   
        uint totalPrice = item.price * _quantity;
        require(msg.value >= totalPrice, "Insufficient funds sent.");
   
        item.stock -= _quantity;

        if (msg.value > totalPrice) {
            payable(msg.sender).transfer(msg.value - totalPrice);
        }

        emit ItemPurchased(_itemId, item.name, _quantity, msg.sender);
    }

    function revertSale(uint _itemId, uint _quantity) public onlyOwner {
        require(_itemId < itemCount, "Item does not exist.");
        
        Item storage item = items[_itemId];
        
        if (_quantity > 0) {
            item.stock += _quantity;
        } else {
            revert("Quantity must be greater than zero for reverting the sale.");
        }
    }

    function validateStore() public view {
    
        assert(owner != address(0));
    }

    receive() external payable {}
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
