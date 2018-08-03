contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}

//This would be a simple contract where anyone could store their lucky number, and it will be associated with their Ethereum address. 
//Then anyone else could look up that person's lucky number using their address.
