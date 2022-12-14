// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.10;

abstract contract OwnerHelper {
    address private owner;

  	event OwnerTransferPropose(address indexed _from, address indexed _to);

  	modifier onlyOwner {
		require(msg.sender == owner);
		_;
  	}

  	constructor() {
		owner = msg.sender;
  	}


    // 자산 옮기기
  	function transferOwnership(address _to) onlyOwner public {
        require(_to != owner);
        require(_to != address(0x0));
        emit OwnerTransferPropose(owner, _to);
    	owner = _to;
  	}
}


abstract contract IssuerHelper is OwnerHelper {
    mapping(address => bool) public issuers;

    event AddIssuer(address indexed _issuer);
    event DelIssuer(address indexed _issuer);

    modifier onlyIssuer { // 함수 실행 제어자
        require(isIssuer(msg.sender) == true);
        _;
    }

    // issuer[0] = 있다면 true
    constructor() {
        issuers[msg.sender] = true;
    }


    // issuer인지 
    function isIssuer(address _addr) public view returns (bool) {
        return issuers[_addr];
    }


    //issuer매핑에  address 값을 추가
    function addIssuer(address _addr) onlyOwner public returns (bool) {
        require(issuers[_addr] == false);
        issuers[_addr] = true;
        emit AddIssuer(_addr);
        return true;
    }


    // issuer가 있다면 false로 바꾼다.
    function delIssuer(address _addr) onlyOwner public returns (bool) {
        require(issuers[_addr] == true);
        issuers[_addr] = false;
        emit DelIssuer(_addr); // 후 삭제
        return true;
    }
}

contract CredentialBox is IssuerHelper {

    uint256 private idCount;
    mapping(uint8 => string) private alumniEnum;
    mapping(uint8 => string) private statusEnum;

    struct Credential{
        uint256 id; // 아이디
        address issuer; // issuer
        uint8 alumniType; // 발급자
        uint8 statusType; // 
        string value; // 암호화된 정보
        uint256 createDate; // 만들어진 날짜
    }

    mapping(address => Credential) private credentials;

    constructor() {
        idCount = 1;
        alumniEnum[0] = "SEB";
        alumniEnum[1] = "BEB";
        alumniEnum[2] = "AIB";
    }

    // 클레임 값들을 생성
    function claimCredential(address _alumniAddress, uint8 _alumniType, string calldata _value) onlyIssuer public returns(bool){
        Credential storage credential = credentials[_alumniAddress];
        require(credential.id == 0);
        credential.id = idCount;
        credential.issuer = msg.sender;
        credential.alumniType = _alumniType;
        credential.statusType = 0;
        credential.value = _value;
        credential.createDate = block.timestamp;

        idCount += 1;

        return true;
    }


    // 크리덴셜 메모리 내의 값들을 접근
    function getCredential(address _alumniAddress) public view returns (Credential memory){
        return credentials[_alumniAddress];
    }


    // 해당 alumnienum 매핑 타입에 따른 값 대입
    function addAlumniType(uint8 _type, string calldata _value) onlyIssuer public returns (bool) {
        require(bytes(alumniEnum[_type]).length == 0);
        alumniEnum[_type] = _value; 
        return true;
    }

    // alumnienum 안에 접근 하여 확인
    function getAlumniType(uint8 _type) public view returns (string memory) {
        return alumniEnum[_type];
    }

    
    // byte로 변환하여 길이로 null 인지 검사 -> 즉 해당 StatusType에 유효성검증 후 값 대입
    function addStatusType(uint8 _type, string calldata _value) onlyIssuer public returns (bool){
        require(bytes(statusEnum[_type]).length == 0);
        statusEnum[_type] = _value;
        return true;
    }

    // Status 매핑에 값에 접근
    function getStatusType(uint8 _type) public view returns (string memory) {
        return statusEnum[_type];
    }

    // address -> Credential로 매핑된 credential의 _alumni 값의 타입을 변경
    function changeStatus(address _alumni, uint8 _type) onlyIssuer public returns (bool) {
        require(credentials[_alumni].id != 0);
        require(bytes(statusEnum[_type]).length != 0);
        credentials[_alumni].statusType = _type;
        return true;
    }
}
