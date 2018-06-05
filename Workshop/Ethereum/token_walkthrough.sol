pragma solidity ^0.4.0

Contract MyToken{
	
	address owner; //who should get our tokens to begin with
	mapping (address => uint256) public balances;

	function MyToken() public {

		owner = msg.sender; //msg.sender is special, here, msg.sender is the account that deployed the contract

		balances[owner] = 999999; //mint the token 999,999 myTokens and publish it

	}

	function transfer (uint amount, address recipient) public {

		require(balances[msg.sender] >= amount);
		require(balances[msg.sender] - amount <= balances[msg.sender]);
		require(balances[msg.sender] + amount >= balances[recipient]);

		// transfer function of amount, sender, can put more stuff too and accessed by public

		balances[msg.sender] -= amount;
		balances[recipient] += amount;

		//Why isn't this quite good enough

		// Once this has been deployed, it can never be updated. But the transfer function can.

	}

}



// Declaring an event - 
event GaveApples(address who, address to, uint amount);

//Calling an event
emit GaveApples(who, to, amount);


// Function modifiers
// Declaring a modifier:
uint votingAge = 18;
mapping(address =>uint) ages;
modifier canVote{
	require(ages[msg.sender] >= votingAge);
}

//Using a modifier:
function vote(address_nominee) public canVote{ 'complete voting logic'}


// Enums (Enumerations)
// Enums can be used to define types and can be created as follows:

Enum WeekDays {Monday, Tuesday, Wednesday, Thursday, Friday}
WeekDays bestDay;
Function setDay(uint_Value) public {
	require(uint(WeekDays.Friday)>= _value);
	bestDay = WeekDays(_value);


//Structs - another way to create a type. Very useful

struct Student{
	address addr;
	string name;
	bool isHonors;
	uint ID;


// Abstract Contract
// Interface


// Libraries - very similar to contracts - they are deployed at an address and their code is reused




//////


pragma solidity ^0.4.18


contract testOriginal{
	uint a = 1000;
	mapping(address => uint);
	function addOneToA(){
		a+=1;
	}
}

contract test is testOriginal{
	// this makes test inherit from testOriginal
}

//// e.g. download Zeppelin ownable stuff safeMaths

contract test{

	function test(uint initialID){
		studentNumber = initialID;
	}

	event StudentAdded(address addr, string name);

	struct Student{
		address addr;
		string name; 
		uinst ID;
	}

	uint studentNumber;
	mapping (uint => Student) students;

	function addStudent(address _addr, string, _name){
		uint id = studentNumber;
		student[id] = Student(_addr, _name);
		studentNumber++;

	}

}
