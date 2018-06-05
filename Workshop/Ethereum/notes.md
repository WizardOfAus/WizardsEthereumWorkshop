Smart Contract Basics

### Table of contents

* [1 References](#1-references)
* [2 Basic Variables](#2-basic-variables)
* [3 Arrays](#3-arrays)
* [4 Mapping](#4-mapping)
* [5 My Simple Token With Bugs](#5-my-simple-token-with-bugs)
* [6 My Simple Token With Bugs Fixed](#6-my-simple-token-with-bugs-fixed)
* [7 My Simple Token With SafeMath](#7-my-simple-token-with-safemath)
* [8 Token Contract](#8-token-contract)
* [9 Crowdsale/Token Contract](#9-crowdsaletoken-contract)

<br />

<hr />

### 1 References

* https://solidity.readthedocs.io/en/develop/
* https://consensys.github.io/smart-contract-best-practices/
* https://remix.ethereum.org/
* https://github.com/ethereum/go-ethereum/releases
* https://github.com/ethereum/wiki/wiki/JavaScript-API
* https://github.com/ethereum/wiki/wiki/JSON-RPC

<br />

<hr />

### 2 Basic Variables

#### Run in Remix

* Load the code below in https://remix.ethereum.org/
* In the **Run** tab, click on the **Create** button
* Click on the blue coloured variable buttons and note the values returned
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/Remix-BasicVariables-20180207-105150.png" /></kbd>
* Set a string variable using the pink `setStringVariable` button, then view the modified `stringVariable` value (or `getStringVariable`, or `getStringVariable1`)
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/Remix-NewStringValue-20180207-105304.png" /></kbd>
* Click on the pink `underflowIntegerVariable` button, then check the integer values
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/Remix-Underflow-20180207-105404.png" /></kbd>
* Click on the pink `overflowIntegerVariable` button twice, then check the integer values
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/Remix-Overflow-20180207-105506.png" /></kbd>

<br />

#### Deploy to Ropsten Testnet

* Load the following code in Remix
* In the **Compile** tab, click on the **Details** button
* In the **BYTECODE** section, copy the hex data in the **object** field to your clipboard
* In https://www.myetherwallet.com/, select the **Network Ropsten (infura.io)** setting on the top right
* Select the **Contracts** tab, then click **Deploy Contract**
* Paste the hex data from the previous step into the **Byte Code** text box
* The **Gas Limit** field should be automatically calculated
* Select and unlock your Ropsten account
  * Fill your account before with with Ropsten ethers - see [The NEW If you need some Ropsten Testnet Ethers ...](https://www.reddit.com/r/ethdev/comments/72ltwj/the_new_if_you_need_some_ropsten_testnet_ethers/)
* Click **Sign Transaction**
* Click **Deploy Contract**
* View your account in https://ropsten.etherscan.io/ . Search for your latest transaction
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-CreateContractTx-20180207-101042.png" /></kbd>
* Click on the created contract
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-CreatedContract-20180207-101119.png" /></kbd>
* Click on the **Contract Code** tab
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-ContractCode-20180207-101149.png" /></kbd>
* Click on **Verify and Publish**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-VerifyAndPublish-20180207-101632.png" /></kbd>
* Paste the source code from Remix into the large text box
* Enter **BasicVariables** in the **Contract Name** field
* Select the **Compiler** version to match your Remix setting. You will find this setting in Remix URL (e.g. `https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.19+commit.c4cbbb05.js`) for compiler version `v0.4.19+commit.c4cbbb05`
* Switch the **Optimisation** field to **Yes** or **No** depending on your Remix setting. You will find this setting in Remix URL (e.g. `https://remix.ethereum.org/#optimize=false&version=soljson-v0.4.19+commit.c4cbbb05.js`) - `optimize=false` => **No**
* Scroll down and click **Verify and Publish**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-VerifyAndPublish-20180207-101632.png" /></kbd>
* Click on the contract address and you will see the **Contract Source Code Verified** message
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-VerifiedContract-20180207-101731.png" /></kbd>

<br />

### Execute The `underflowIntegerVariable` Function On Ropsten

* In https://www.myetherwallet.com/, select the **Contracts** tab, then click **Interact with Contract**
* In the **Contract Address** field, enter the address of your newly created contract
* In the **ABI / JSON Interface** text box, enter the **Contract ABI** data from the EtherScan page for your newly deployed contract
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/MEW-InteractWithContract-20180207-110338.png" /></kbd>
* Click **Access**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/MEW-Access-20180207-110437.png" /></kbd>
* Select **underflowIntegerVariables**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/MEW-SelectFunction-20180207-110545.png" /></kbd>
* Select **Generate Transaction**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/MEW-GenerateTransaction-20180207-110559.png" /></kbd>
* Select **Yes, I am sure! Make transaction.**
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/MEW-MakeTransaction-20180207-110610.png" /></kbd>
* View the latest transaction from your account in EtherScan
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-UnderflowTx-20180207-110737.png" /></kbd>
* View the **Read Smart Contract** in EtherScan and note the underflowed variables
  <kbd><img src="https://github.com/bokkypoobah/BokkyPooBahsEthereumWorkshop/blob/master/images/EtherScan-ReadSmartContract-20180207-110759.png" /></kbd>


<br />

### Source Code

```javascript
pragma solidity ^0.4.19;


contract BasicVariables {

    string public stringVariable = "original value";

    // Private variables cannot be viewed from outside
    string privateStringVariable;

    // Both variables below are of the same type
    uint public unsignedIntegerVariable;
    uint256 public unsignedInteger256Variable;

    // uint8, uint16, uint24, ..., uint256 
    uint8 public unsignedInteger8Variable;

    // Other types
    bool public booleanVariable = true;

    // Constructor has the same name as the contract
    function BasicVariables() public {
        stringVariable = "Hello, World!";
        privateStringVariable = "you can't see me";
        unsignedIntegerVariable = 1;
        unsignedInteger256Variable = 1;
        unsignedInteger8Variable = 1;
    }

    function setStringVariable(string newValue) public {
        stringVariable = newValue;
    }

    function getStringVariable() public view returns (string) {
        return stringVariable;
    }

    function getStringVariable1() public view returns (string returnValue) {
        returnValue = stringVariable;
    }

    function underflowIntegerVariables() public {
        unsignedIntegerVariable = unsignedIntegerVariable - 2;
        unsignedInteger256Variable = unsignedInteger256Variable - 2;
        unsignedInteger8Variable = unsignedInteger8Variable - 2;
    }

    function overflowIntegerVariables() public {
        unsignedIntegerVariable = unsignedIntegerVariable + 2;
        unsignedInteger256Variable = unsignedInteger256Variable + 2;
        unsignedInteger8Variable = unsignedInteger8Variable + 2;
    }

    function toggleBooleanVariable() public {
        booleanVariable = !booleanVariable;
    }
}
```

<br />

<hr />

### 3 Arrays

```javascript
pragma solidity ^0.4.19;


contract Arrays {

    uint[] public uintArray;
    string[] public stringArray;

    // Constructor has the same name as the contract
    function Arrays() public {
        uintArray.push(123);
        stringArray.push("first element");
    }

    function uintArrayLength() public constant returns (uint) {
        return uintArray.length;
    }
    
    function addUintElement(uint element) public {
        uintArray.length++;
        uintArray[uintArray.length-1] = element;
    }

    function stringArrayLength() public constant returns (uint stringArrayLen) {
        stringArrayLen = stringArray.length;
    }
    
    function addStringElement(string element) public {
        stringArray.push(element);
    }
}
```

<br />

<hr />

### 4 Mapping

```javascript
pragma solidity ^0.4.19;


contract Mapping {

    mapping(address => uint) public balances;

    // Constructor has the same name as the contract
    function Mapping() public {
    }

    function add() public {
        // msg.sender is the account sending the transaction
        balances[msg.sender] = balances[msg.sender] + 1;
    }

    function get() public view returns (uint) {
        // msg.sender is the account calling this function
        return balances[msg.sender];
    }
}
```

<br />

<hr />

### 5 My Simple Token With Bugs

```javascript
pragma solidity ^0.4.19;

contract MySimpleTokenWithBugs {

    mapping(address => uint) public balanceOf;

    // Constructor has the same name as the contract
    function MySimpleTokenWithBugs() public {
        balanceOf[msg.sender] = 1000000;
    }

    function transfer(address to, uint tokens) public {
        // Can underflow this mapping entry
        balanceOf[msg.sender] = balanceOf[msg.sender] - tokens;
        // Can overflow this mapping entry
        balanceOf[to] = balanceOf[to] + tokens;
    }
}
```

<br />

<hr />

### 6 My Simple Token With Bugs Fixed

```javascript
pragma solidity ^0.4.19;


contract MySimpleTokenWithBugsFixed {

    mapping(address => uint) public balanceOf;

    // Constructor has the same name as the contract
    function MySimpleTokenWithBugsFixed() public {
        balanceOf[msg.sender] = 1000000;
    }

    function transfer(address to, uint tokens) public {
        require(balanceOf[msg.sender] >= tokens);
        balanceOf[msg.sender] = balanceOf[msg.sender] - tokens;
        require(balanceOf[to] + tokens >= balanceOf[to]);
        balanceOf[to] = balanceOf[to] + tokens;
    }
}
```

<br />

<hr />

### 7 My Simple Token With SafeMath

```javascript
pragma solidity ^0.4.19;

// ----------------------------------------------------------------------------
// BokkyPooBah's Ethereum Workshop #31
//
// Enjoy. (c) BokkyPooBah / Bok Consulting Pty Ltd 2018. The MIT Licence.
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths, borrowed from OpenZeppelin
// ----------------------------------------------------------------------------
library SafeMath {

    // ------------------------------------------------------------------------
    // Add a number to another number, checking for overflows
    // ------------------------------------------------------------------------
    function add(uint a, uint b) pure internal returns (uint) {
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }

    // ------------------------------------------------------------------------
    // Subtract a number from another number, checking for underflows
    // ------------------------------------------------------------------------
    function sub(uint a, uint b) pure internal returns (uint) {
        assert(b <= a);
        return a - b;
    }
}


contract MySimpleTokenWithSafeMath {
    using SafeMath for uint;

    mapping(address => uint) public balanceOf;
    uint public totalSupply;

    // Constructor has the same name as the contract
    function MySimpleTokenWithSafeMath() public {
        totalSupply = 1000000;
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint tokens) public {
        balanceOf[msg.sender] = balanceOf[msg.sender].sub(tokens);
        balanceOf[to] = balanceOf[to].add(tokens);
    }
}
```

<br />

<hr />

### 8 Token Contract

```javascript
pragma solidity ^0.4.19;

// ----------------------------------------------------------------------------
// MYT 'MyToken' token contract sample contract.
//
// NOTE: Use at your own risk as this contract has not been audited
//
// Symbol      : MYT
// Name        : MyToken
// Total supply: Unlimited
// Decimals    : 18
//
// Enjoy.
//
// (c) bitfwd. The MIT Licence.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    uint public totalSupply;
    function balanceOf(address account) public constant returns (uint balance);
    function transfer(address to, uint value) public returns (bool success);
    function transferFrom(address from, address to, uint value)
        public returns (bool success);
    function approve(address spender, uint value) public returns (bool success);
    function allowance(address owner, address spender) public constant
        returns (uint remaining);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {

    // ------------------------------------------------------------------------
    // Current owner, and proposed new owner
    // ------------------------------------------------------------------------
    address public owner;
    address public newOwner;

    // ------------------------------------------------------------------------
    // Constructor - assign creator as the owner
    // ------------------------------------------------------------------------
    function Owned() public {
        owner = msg.sender;
    }


    // ------------------------------------------------------------------------
    // Modifier to mark that a function can only be executed by the owner
    // ------------------------------------------------------------------------
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }


    // ------------------------------------------------------------------------
    // Owner can initiate transfer of contract to a new owner
    // ------------------------------------------------------------------------
    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }


    // ------------------------------------------------------------------------
    // New owner has to accept transfer of contract
    // ------------------------------------------------------------------------
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }
    event OwnershipTransferred(address indexed from, address indexed to);
}


// ----------------------------------------------------------------------------
// Safe maths, borrowed from OpenZeppelin
// ----------------------------------------------------------------------------
library SafeMath {

    // ------------------------------------------------------------------------
    // Add a number to another number, checking for overflows
    // ------------------------------------------------------------------------
    function add(uint a, uint b) pure internal returns (uint) {
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }

    // ------------------------------------------------------------------------
    // Subtract a number from another number, checking for underflows
    // ------------------------------------------------------------------------
    function sub(uint a, uint b) pure internal returns (uint) {
        assert(b <= a);
        return a - b;
    }
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals
// ----------------------------------------------------------------------------
contract MyToken is ERC20Interface, Owned {
    using SafeMath for uint;

    // ------------------------------------------------------------------------
    // Token parameters
    // ------------------------------------------------------------------------
    string public constant symbol = "MYT";
    string public constant name = "MyToken";
    uint8 public constant decimals = 18;
    uint public totalSupply = 0;

    // ------------------------------------------------------------------------
    // Balances for each account
    // ------------------------------------------------------------------------
    mapping(address => uint) balances;

    // ------------------------------------------------------------------------
    // Owner of account approves the transfer tokens to another account
    // ------------------------------------------------------------------------
    mapping(address => mapping (address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function MyToken() public Owned() {
    }


    // ------------------------------------------------------------------------
    // Get the account balance of another account with address account
    // ------------------------------------------------------------------------
    function balanceOf(address account) public constant returns (uint balance) {
        return balances[account];
    }


    // ------------------------------------------------------------------------
    // Transfer the balance from owner's account to another account
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Allow spender to withdraw from your account, multiple times, up to the
    // value tokens. If this function is called again it overwrites the
    // current allowance with value.
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Spender of tokens transfer an tokens of tokens from the token owner's
    // balance to another account. The owner of the tokens must already
    // have approve(...)-d this transfer
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public
        returns (bool success)
    {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(from, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Returns the number of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address owner, address spender ) public 
        constant returns (uint remaining)
    {
        return allowed[owner][spender];
    }
}
```

<br />

<hr />

### 9 Crowdsale/Token Contract

```javascript
pragma solidity ^0.4.19;

// ----------------------------------------------------------------------------
// MYT 'MyToken' crowdsale/token contract sample contract.
//
// NOTE: Use at your own risk as this contract has not been audited
//
// Symbol      : MYT
// Name        : MyToken
// Total supply: Unlimited
// Decimals    : 18
//
// Enjoy.
//
// (c) bitfwd. The MIT Licence.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    uint public totalSupply;
    function balanceOf(address account) public constant returns (uint balance);
    function transfer(address to, uint value) public returns (bool success);
    function transferFrom(address from, address to, uint value)
        public returns (bool success);
    function approve(address spender, uint value) public returns (bool success);
    function allowance(address owner, address spender) public constant
        returns (uint remaining);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {

    // ------------------------------------------------------------------------
    // Current owner, and proposed new owner
    // ------------------------------------------------------------------------
    address public owner;
    address public newOwner;

    // ------------------------------------------------------------------------
    // Constructor - assign creator as the owner
    // ------------------------------------------------------------------------
    function Owned() public {
        owner = msg.sender;
    }


    // ------------------------------------------------------------------------
    // Modifier to mark that a function can only be executed by the owner
    // ------------------------------------------------------------------------
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }


    // ------------------------------------------------------------------------
    // Owner can initiate transfer of contract to a new owner
    // ------------------------------------------------------------------------
    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }


    // ------------------------------------------------------------------------
    // New owner has to accept transfer of contract
    // ------------------------------------------------------------------------
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = 0x0;
    }
    event OwnershipTransferred(address indexed from, address indexed to);
}


// ----------------------------------------------------------------------------
// Safe maths, borrowed from OpenZeppelin
// ----------------------------------------------------------------------------
library SafeMath {

    // ------------------------------------------------------------------------
    // Add a number to another number, checking for overflows
    // ------------------------------------------------------------------------
    function add(uint a, uint b) pure internal returns (uint) {
        uint c = a + b;
        assert(c >= a && c >= b);
        return c;
    }

    // ------------------------------------------------------------------------
    // Subtract a number from another number, checking for underflows
    // ------------------------------------------------------------------------
    function sub(uint a, uint b) pure internal returns (uint) {
        assert(b <= a);
        return a - b;
    }

    // ------------------------------------------------------------------------
    // Multiply two numbers
    // ------------------------------------------------------------------------
    function mul(uint a, uint b) pure internal returns (uint) {
        uint c = a * b;
        assert(a == 0 || c / a == b);
        return c;
    }

    // ------------------------------------------------------------------------
    // Multiply one number by another number
    // ------------------------------------------------------------------------
    function div(uint a, uint b) pure internal returns (uint) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals
// ----------------------------------------------------------------------------
contract MyToken is ERC20Interface, Owned {
    using SafeMath for uint;

    // ------------------------------------------------------------------------
    // Token parameters
    // ------------------------------------------------------------------------
    string public constant symbol = "MYT";
    string public constant name = "MyToken";
    uint8 public constant decimals = 18;
    uint public totalSupply = 0;

    // ------------------------------------------------------------------------
    // Balances for each account
    // ------------------------------------------------------------------------
    mapping(address => uint) balances;

    // ------------------------------------------------------------------------
    // Owner of account approves the transfer tokens to another account
    // ------------------------------------------------------------------------
    mapping(address => mapping (address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function MyToken() public Owned() {
    }


    // ------------------------------------------------------------------------
    // Get the account balance of another account with address account
    // ------------------------------------------------------------------------
    function balanceOf(address account) public constant returns (uint balance) {
        return balances[account];
    }


    // ------------------------------------------------------------------------
    // Transfer the balance from owner's account to another account
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Allow spender to withdraw from your account, multiple times, up to the
    // value tokens. If this function is called again it overwrites the
    // current allowance with value.
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Spender of tokens transfer an tokens of tokens from the token owner's
    // balance to another account. The owner of the tokens must already
    // have approve(...)-d this transfer
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public
        returns (bool success)
    {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(from, to, tokens);
        return true;
    }


    // ------------------------------------------------------------------------
    // Returns the number of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address owner, address spender ) public 
        constant returns (uint remaining)
    {
        return allowed[owner][spender];
    }


    // ------------------------------------------------------------------------
    // Mint coins for a single account
    // ------------------------------------------------------------------------
    function mint(address to, uint tokens) internal {
        require(to != 0x0 && tokens != 0);
        balances[to] = balances[to].add(tokens);
        totalSupply = totalSupply.add(tokens);
        Transfer(0x0, to, tokens);
    }


    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens)
      public onlyOwner returns (bool success)
    {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
}


contract MyCrowdsale is MyToken {

    // ------------------------------------------------------------------------
    // Start Date
    //   > new Date('2018-02-06T08:00:00+11:00').getTime()/1000
    //   1517864400
    //   > new Date(1517864400 * 1000).toString()
    //   "Tue, 06 Feb 2018 08:00:00 AEDT"
    // End Date
    //   Start Date + 4 weeks
    // ------------------------------------------------------------------------
    uint public constant START_DATE = 1517864400;
    uint public constant END_DATE = START_DATE + 4 weeks;

    // Hard cap
    uint public constant ETH_HARD_CAP = 5 ether;

    // Tokens per 1,000 ETH
    uint public constant tokensPerKEther = 1000000; 

    // Keep track of ETH raised
    uint public ethersRaised;

    // Crowdsale finalised?
    bool public finalised;

    // Tokens transferable?
    bool public transferable;

    // My coffer
    address public wallet; 


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    function MyCrowdsale() public MyToken() {
        wallet = msg.sender;
    }


    // ------------------------------------------------------------------------
    // Add precommitment funding token balance and ether cost before the
    // crowdsale commences
    // ------------------------------------------------------------------------
    function addPrecommitment(address participant, uint tokens, uint ethers) public onlyOwner {
        // Can only add precommitments before the crowdsale starts
        require(block.timestamp < START_DATE);

        // Check tokens > 0
        require(tokens > 0);

        // Mint tokens
        mint(participant, tokens);

        // Keep track of ethers raised
        ethersRaised = ethersRaised.add(ethers);

        // Log event
        PrecommitmentAdded(participant, tokens, ethers);
    }
    event PrecommitmentAdded(address indexed participant, uint tokens, uint ethers);


    // ------------------------------------------------------------------------
    // Fallback function to receive ETH contributions send directly to the
    // contract address
    // ------------------------------------------------------------------------
    function() public payable {
        proxyPayment(msg.sender);
    }


    // ------------------------------------------------------------------------
    // Receive ETH contributions. Can use this to send tokens to another
    // account
    // ------------------------------------------------------------------------
    function proxyPayment(address contributor) public payable {
        // Check we are still in the crowdsale period
        require(block.timestamp >= START_DATE && block.timestamp <= END_DATE);

        // Check for invalid address
        require(contributor != 0x0);

        // Check that contributor has sent ETH
        require(msg.value > 0);

        // Keep track of ETH raised
        ethersRaised = ethersRaised.add(msg.value);

        // Check we have not exceeded the hard cap
        require(ethersRaised <= ETH_HARD_CAP);

        // Calculate tokens for contributed ETH
        uint tokens = msg.value.mul(tokensPerKEther).div(1000);

        // Mint tokens for contributor
        mint(contributor, tokens);

        // Log ETH contributed and tokens generated
        TokensBought(contributor, msg.value, tokens);

        // Transfer ETH to coffer 
        wallet.transfer(msg.value);
    }
    event TokensBought(address indexed contributor, uint ethers, uint tokens);


    // ------------------------------------------------------------------------
    // Finalise crowdsale, 20% of tokens for myself
    // ------------------------------------------------------------------------
    function finalise() public onlyOwner {
        // Can only finalise once
        require(!finalised);

        // Can only finalise if we are past end date, or hard cap reached
        require(block.timestamp > END_DATE || ethersRaised == ETH_HARD_CAP);

        // Mark as finalised 
        finalised = true;

        // Allow tokens to be transferable
        transferable = true;

        // Mint tokens for my coffer, being 20% of crowdsold tokens
        uint myTokens = totalSupply.mul(20).div(80);
        mint(owner, myTokens);
    }


    // ------------------------------------------------------------------------
    // transfer tokens, only transferable after the crowdsale is finalised
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        // Can only transfer after crowdsale completed
        require(transferable);
        return super.transfer(to, tokens);
    }


    // ------------------------------------------------------------------------
    // transferFrom tokens, only transferable after the crowdsale is finalised
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public
        returns (bool success)
    {
        // Can only transfer after crowdsale completed
        require(transferable);
        return super.transferFrom(from, to, tokens);
    }
}
```
