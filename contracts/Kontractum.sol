pragma solidity >=0.4.22 <0.9.0;

contract Kontractum {
	uint public contractCount = 0;

	struct Contract{
		uint id;
		string title;
	}
	mapping(uint => Contract) public contracts;

  event ContractCreated(
    uint id,
    string title
  );

  constructor() public {
    createContract("Check out dappuniversity.com");
  }

  function createContract(string memory _title)
        public
    {
        contractCount++;
        contracts[contractCount] = Contract(
            contractCount,
            _title
        );
        emit ContractCreated(
            contractCount,
            _title
        );
    }
}