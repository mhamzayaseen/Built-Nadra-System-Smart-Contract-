//  SSPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Nadra{
    struct person {
string name;
address Address;
uint cnic;
uint dob;
uint treeNumber;
}
event nadraRecord (string  _name, address _Address, uint _cnic, uint _dob , uint _treeNumber );
mapping (uint => person )private nadra;
uint public countId;
function addDetails(string memory _name, address _Address, uint _cnic, uint _dob , uint _treeNumber)public{
countId++;
nadra[countId]=person(_name,_Address,_cnic, _dob, _treeNumber);
emit nadraRecord(_name,_Address,_cnic, _dob, _treeNumber);

}
function getDetailById(uint _id) public view returns(string memory, address, uint, uint ,uint){
   return( nadra[_id].name, nadra[_id].Address, nadra[_id].cnic,  nadra[_id].dob,  nadra[_id].treeNumber);
}


function getAllDetails()public view returns(person[] memory){
    person[] memory getDetails = new person[](countId);
for(uint i=1; i< countId; i++){
    getDetails[i]=nadra[i];
}
    return getDetails;

}
}
