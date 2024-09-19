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
