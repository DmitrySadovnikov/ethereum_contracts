pragma solidity ^0.4.19;


contract ExchangeContract {
  address buyer;
  address seller;
  address creator;
  uint    amount;

  bool public isAccepted;

  event buyerSet(address addr);
  event sellerSet(address addr);
  event accepted;

  function ExchangeContract() public {
    creator = msg.sender;
  }

  modifier ifCreator() {
    if (creator == msg.sender) {
      revert();
    }
    else {
      _;
    }
  }

  modifier ifBuyer() {
    if (buyer == msg.sender) {
      revert();
    }
    else {
      _;
    }
  }

  modifier ifSeller() {
    if (seller == msg.sender) {
      revert();
    }
    else {
      _;
    }
  }

  function setBuyer(address addr) public ifCreator {
    buyer = addr;
    buyerSet(addr);
  }

  function setSeller(address addr) public ifCreator {
    seller = addr;
    sellerSet(addr);
  }

  function getBuyer() public constant returns (address) {
    return buyer;
  }

  function getSeller() public constant returns (address) {
    return seller;
  }

  function getCreator() public constant returns (address) {
    return creator;
  }

  function accept() public ifSeller ifCreator {
    isAccepted = true;
    accepted;
  }
}
