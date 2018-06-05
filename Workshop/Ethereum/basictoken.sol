contract BasicToken {

  /* Maps account addresses to token balances */
  mapping (address => uint256) public balanceOf;

  /* Initializes contract with initial supply
  tokens to the creator of the contract */
  function BasicToken(uint256 initialSupply)
  {
    // Give the creator all initial tokens
    balanceOf[msg.sender] = initialSupply;
  }

  /* Send tokens to a recipient address */
  function transfer(address to, uint256 value)
  {
    if (balanceOf[msg.sender] < value) throw; // Check if the sender has enough
    balanceOf[msg.sender] -= value; // Subtract from the sender
    balanceOf[to] += value; // Add the same to the recipient
  }
}
