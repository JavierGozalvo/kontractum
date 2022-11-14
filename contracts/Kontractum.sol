pragma solidity >=0.4.22 <0.9.0;

contract Kontractum {
	uint public contractCount = 0;

	struct Contract{
		uint id;
		string fileHash;
    string owner;
    string beneficiary;
	}
	mapping(uint => Contract) public contracts;

  event ContractCreated(
    uint id,
    string fileHash,
    string owner,
    string beneficiary
  );

  function createContract(string memory _fileHash, string memory _owner, string memory _beneficiary)
        public
    {
        contractCount++;
        contracts[contractCount] = Contract(
            contractCount,
            _fileHash,
            _owner,
            _beneficiary
        );
        emit ContractCreated(
            contractCount,
            _fileHash,
            _owner,
            _beneficiary
        );
    }
}