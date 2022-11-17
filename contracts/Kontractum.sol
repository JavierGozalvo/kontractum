pragma solidity >=0.4.22 <0.9.0;

contract Kontractum {
	uint public contractCount = 0;

	struct Contract{
		uint id;
		string fileHash;
    string userFirm;
	}
	mapping(uint => Contract) public contracts;

  event ContractCreated(
    uint id,
    string fileHash,
    string userFirm
  );

  function createContract(string memory _fileHash, string memory _userFirm)
        public
    {
        contractCount++;
        contracts[contractCount] = Contract(
            contractCount,
            _fileHash,
            _userFirm
        );
        emit ContractCreated(
            contractCount,
            _fileHash,
            _userFirm
        );
    }
}