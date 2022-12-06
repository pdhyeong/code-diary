// SPDX-License-Identifier: GPL-3.0
// OpenZeppelin Contracts (last updated v4.8.0) (token/ERC721/ERC721.sol)

pragma solidity >=0.7.0 <0.9.0;


contract ERC721 {
    string private _name; // 토큰의 이름
    string private _symbol; // 토큰의 심볼 저장
    mapping(uint256 => address) private _owners; // 각 토큰의 id와 토큰 소유자 주소 매핑
    mapping(address => uint256) private _balances; // 토큰 소유자의 주소와 소유자가 가지고 있는 토큰의 개수 매핑
    mapping(uint256 => address) private _tokenApprovals; // 토큰 id와 approved된 주소를 매핑
    mapping(address => mapping(address => bool)) private _operatorApprovals; // 토큰 소유자와 operator주소의 approval여부를 저장
    
    // ex) 0x1234 가 0x5678에게 자신의 모든 토큰을 관리할  operator권한을 주는 경우 =>
    // _operatorApprovals[0x1234][0x5678] // true
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    function balanceOf(address owner) public view virtual override returns (uint256) {
        // owner 주소가 0인경우 
        require(owner != address(0), "ERC721: address zero is not a valid owner");

        // balances 변수에 매핑 된 값 가져오기 => 키값인 주소를 넣으면 uint256의 값이 나옴
        return _balances[owner];
    }
    
    function ownerOf(uint256 tokenId) public view virtual override returns (address) {

        //토큰 인덱스값을 넣어 나오는 주소값
        address owner = _owners[tokenId];

        // 0이 아닌경우
        require(owner != address(0),"ERC721: invalid token ID");

        // 해당 onwer의 주소 반환
        return owner;
    }

    function approve(address to,uint256 tokenId) public virtual override {
        // 유효성 검사 1. operator(to)의 주소와 토큰의 owner가 동일인인지
        address owner = ERC721.ownerOf(tokenId);
        require(to != owner , "ERC721: approval to current owner");



        // 유효성 검사 2 . approve 함수를 호출한 사람과 토큰의 owner 동일인 여부 확인
        require(
            _msgSender() == owner || isApprovedForAll(owner, _msgSender()),
            "ERC721: approve caller is not token owner nor approved for all"
        );


        _approve(to,tokenId);
    }

    function _approve(address to, uint256 tokenId) internal virtual{

        // 해당 인덱스의 키값에 보내는 주소를 넣는다.
        _tokenApprovals[tokenId] = to;
        
        //이벤트 실행 
        emit Approval(ERC721.ownerOf(tokenId,to,tokenId));
    }

    function getApproved(uint256 tokenId) public view virtual override returns (address) {

        // 해당 토큰 아이디에 해당 하는 주소 값 반환 즉 승인된 operator 주소
        return _tokenApprovals[tokenId];
    }

    // 모든 NFT를 특정 operator에게 승인하는 함수
    function setApprovalForAll(address operator, bool approved) public override {

        // 
        _setApprovalForAll(_msgSender(), operator, approved);
    }

    function _setApprovalForAll(address owner, address operator,bool approved) internal virtual{

        require(owner != operator, "ERC721: approve to caller");
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }

    function isApprovedForAll(address owner,address operator) public view virtual override returns(bool){
        return _operatorApprovals[owner][operator];
    }

    function transferFrom(address from,address to, uint256 tokenId) public virtual override {
        require(_isApprovedOrOwner(_msgSender(),tokenId),"ERC721: caller is not token owner nor approved");

        _transfer(from, to , tokenId);
    }

    function _isApprovedOrOwner(address spender,uint256 tokenId) internal view virtual returns (bool) {
        address owner = ERC721.ownerOf(tokenId);
        return (spender == owner || isApprovedForAll(owner, spender) || getApproved(tokenId) == spender);
    }
    
    function _transfer(address from,address to, uint256 tokenId) internal virtual {
        require(ERC721.ownerOf(tokenId)==from ,"ERC721: transfer from incorrect owner");
        require(to != address(0),"ERC721: transfer to the zero address");


        _approve(address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from,to,tokenId);
    }
    
    function _safeTransfer(address from,address to, uint256 tokenId, bytes memory data) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from,to,tokenId,data),"ERC721: transfer to non ERC721Received implementer");
    }

    function _checkOnERC721Received(address from , address to , uint256 tokenId,bytes memory data) private returns (bool) {
        if(to.isContract()) {
            try IERC721Receiver(to).inERC721Received(_msgSender(),from,tokenId,data) returns (bytes4 retval) {
                return retval == IERC721Receiver._checkOnERC721Received.selector;
            } catch(bytes memory reason) {
                if(reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    assembly {
                        revert(add(32,reason), mlood(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }
    function onERC721Received(address msgSender, address nftContractAddress,uint256 _tokenId,bytes calldata _data) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
    
    function _safeTransfer(address from,address to, uint256 tokenId,bytes memory data) internal virtual  {
        _transfer(from,to,tokenId);
        require(_checkOnERC721Received(from, to, tokenId, data),"ERC721: transfer to non ERC721Receiver implementer");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override {
        safeTransferFrom(from,to,tokenId,"");
    }
    
    function safeTransferFrom(address from,address to,uint256 tokenId,bytes memory data) public virtual override {
        require(_isApprovedOrOwner(_msgSender(),tokenId),"ERC721: caller is not token owner or approved");
        _safeTransfer(from,to,tokenId,data);
    }

    function _safeTransferFrom(address from, address to, uint256 tokenId,bytes memory data) internal virtual {
        _transfer(from, to, tokenId);
        require(_checkOnERC721Received(from, to, tokenId, data),"ERC721: transfer to non ERC721Receiver implementer");
    }
}
