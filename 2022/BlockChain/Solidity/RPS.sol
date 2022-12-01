//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract RPS {
    constructor () payable {}


    enum Hand {
        rock, paper, scissors
    }
    enum PlayerStatus {
        STATUS_WIN, STATUS_LOSE, STATUS_TIE, STATUS_PENDING
    }
    struct Player {
        address payable addr;
        uint256 playerBetAmount;
        uint256 determine;
        PlayerStatus playerStatus;
    }
    struct Game {
        Player originator;
        Player taker;
        uint256 betAmount;
        GameStatus gameStatus;
        uint count;
    }
    mapping (uint => Game) rooms;
    uint roomLen = 0;
    uint count = 0;

    enum GameStatus {
        STATUS_NOT_STARTED, STATUS_STARTED, STATUS_COMPLETE, STATUS_ERROR
    }

    modifier isValidHand(Hand _hand) {
        require((_hand == Hand.rock) || (_hand == Hand.paper) || (_hand == Hand.scissors));
        _;
    }
    modifier isPlayer(uint roomNum,address sender) {
        require(sender == rooms[roomNum].originator.addr || sender == rooms[roomNum].taker.addr);
        _;
    }
    function createRoom(uint _determine) public payable  returns(uint roomNum) {
        rooms[roomLen] = Game({
            betAmount: msg.value,
            gameStatus: GameStatus.STATUS_NOT_STARTED,
            originator: Player({
                determine: _determine,
                addr: payable(msg.sender),
                playerStatus: PlayerStatus.STATUS_PENDING,
                playerBetAmount: msg.value
            }),
            taker: Player({
                determine: _determine,
                addr: payable(msg.sender),
                playerStatus: PlayerStatus.STATUS_PENDING,
                playerBetAmount: 0
            }),
            count: 2
        });
        roomNum = roomLen;
        roomLen += 1;
    }
    function joinRoom(uint roomNum,uint _determine) public payable  {
        rooms[roomNum].taker = Player({
            determine: _determine,
            addr: payable(msg.sender),
            playerStatus: PlayerStatus.STATUS_PENDING,
            playerBetAmount: msg.value
        });
        rooms[roomNum].betAmount += msg.value;
        compareHands(roomNum);
        rooms[roomNum].count += 1;
    }
    function checkTotalPay(uint roomNum) public view returns(uint roomNumPay) {
        return rooms[roomNum].betAmount;
    }
    function payout(uint roomNum) public payable isPlayer(roomNum,msg.sender) {
        if(rooms[roomNum].originator.playerStatus == PlayerStatus.STATUS_TIE && rooms[roomNum].taker.playerStatus == PlayerStatus.STATUS_TIE) {
            rooms[roomNum].originator.addr.transfer(rooms[roomNum].originator.playerBetAmount);
            rooms[roomNum].taker.addr.transfer(rooms[roomNum].taker.playerBetAmount);
        }
        else {
            if(rooms[roomNum].originator.playerStatus == PlayerStatus.STATUS_WIN) {
                rooms[roomNum].originator.addr.transfer(rooms[roomNum].betAmount);
            }
            else if(rooms[roomNum].taker.playerStatus == PlayerStatus.STATUS_WIN) {
                rooms[roomNum].taker.addr.transfer(rooms[roomNum].betAmount);
            }
            else {
                rooms[roomNum].originator.addr.transfer(rooms[roomNum].originator.playerBetAmount);
                rooms[roomNum].taker.addr.transfer(rooms[roomNum].taker.playerBetAmount);
            }
        }
        rooms[roomNum].gameStatus = GameStatus.STATUS_COMPLETE;
    }
    function maxCheckroom () public view returns(uint) {
        uint max = 0;
        uint idx = 0;
        for(uint i = 0;i<roomLen;i++){
            if(max < rooms[i].betAmount){
                max = rooms[i].betAmount;
                idx = i;
            }
        }
        return idx;
    }
    function compareHands(uint roomNum) private {
        uint8 originator = uint8(uint256(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) + rooms[roomNum].originator.determine) % 3;
        uint8 taker = uint8(uint256(keccak256(abi.encodePacked(block.timestamp,block.difficulty,msg.sender))) + rooms[roomNum].taker.determine) % 3;

        rooms[roomNum].gameStatus = GameStatus.STATUS_STARTED;

        if(taker == originator) {
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_TIE;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_TIE;
        }
        else if((taker + 1) % 3 == originator) {
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_WIN;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_LOSE;
        }
        else if((originator + 1) % 3 == taker) {
            rooms[roomNum].originator.playerStatus = PlayerStatus.STATUS_LOSE;
            rooms[roomNum].taker.playerStatus = PlayerStatus.STATUS_WIN;
        }
        else {
            rooms[roomNum].gameStatus = GameStatus.STATUS_ERROR;
        }
    }
    function countper (uint roomidx) public view returns(uint){
        return rooms[roomidx].count;
    }
}
