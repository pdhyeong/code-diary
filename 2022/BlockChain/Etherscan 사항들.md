## Etherscan

### 검색화면 
```
 - Transaction : 트랜잭션 ID
  
 - Status : 트랜잭션의 성공 여부
  
 - Block : 트랜잭션이 기록된 블록의 숫자

 - Timestamp : 트랜젹션이 채굴된 시간

 - From : 트랜잭션 보내는 사람 주소

 - To : 트랜잭션 받는사람 주소

 - Value: 보내는 이더 양

 - Transaction Fee : 트랜잭션을 블록에 포함하여 새로운 블록을 제안하는 proposer 및 올바른 투표를 진행하는 vaildator들에게 지급되는 수수로

 - Gas Price : 트랜잭션을 수행하는 데 소요되는 가스당 비용

 - Gas Limit & Usage by Txn : 트랜잭션을 실행하는데 드는 소모할 가스의 한도와 실제로 트랜잭션 수행 시 소모된 가스의 양. 일반적인 이더리움 트랜잭션에서는 21,000 가스를 사용한다.

 - Gas Fees : Gas Fee는 Base Fee와 Max Fee, Priority Fee로 나뉜다. 
	Base Fee는 블록포함에 필요한 기본 가스양 
	Max Fee는 지불할 가스비의 최대 한도
	Max Priority Fee는 올바른 투표를 진행한 vaildator들에게 제공하는 수수료의 최대치

 - Burnt & Txn Savings Fees: Base Fee는 트랜잭션이 실행되면 소각된다. 이 소각된 양이 Burnt이다. Max Fee에서 소각된 Base Fee와 채굴자에게 수수료로 낸 Priority Fee를 제외한 가스는 돌려받게 되는데, 이것이 Txn Savings이다.

 - Others : Txn Type은 트랜잭션 타입을 의미한다. 그외에 논스값, 블록에서 몇번째에 기록되어 있는지 등을 확인할 수 있다.

 - Input Data : 트랜잭션 실행 시 함께 보내진 16진수 데이터이다.
```


----------------------------------------


### 이더 스캔에서 블록 ID를 클릭하면 블록에 대한 상세한 사항들

```
- Block Height : 제네시스 블록으로부터 몇 번째 블록인지

- Status : 현재 블록의 상태를 의미한다. Latest : validator가 검증한 가장 최근 블록 Safe: validator 집단의 3분의 2 이상의 증명을 받은 블록

- TimeStamp: 블록이 체인에 올라간 시점

- Proposed On: 현재 블록이 포함된 slot과 epoch의 값을 나타낸다. slot은 검증 집다닝 모여 12초를 간격으로 블록을 생성하는 단위 epoch은 32개의 slot이 모인 단위


- Transactions :  블록에 들어있는 트랜잭션의 개수. Contract internal transactios는 컨트랙트 실행결과로 생성된 트랜잭션을 의미한다.

- Fee Recipient : 해당 블록의 트랜잭션 수수료를 받을 주소

- Block Reward : 블록 채굴 보상, 보상은 (일반채굴 보상 + 트랜잭션 수수료 - 소각된 수수료)로 산정 된다.

- Total Difficulty : 제네시스 블록부터 해당 블록까지의 전체채굴 난이도를 뜻했으나, PoS 업데이트 이후 같은 값으로 유지 되고 있다.

- Size : 블록의 사이즈 블록의 사이즈는 gas Limit로 측정된다.

- Gas Used : 블록 내에서 사용된 가스의 총량과 블록에 저장된 가스의 양

- Gas Limit : 블록 내 모든 트랜잭션의 Gas Limit 총량

- Base Fee per Gas : Post - London Upgrade이후, 트랜잭션이 블록에 포함되기 위한 최소한의 gas Used 승수

- Extra data : 블록 제안 노드에 의해 블록에 포함되는 추가적인 데이터

- Hash : 현재 블록의 블록헤더 해시값

- Parent Hash: 직전 블록의 블록헤더 해시값

- StateRoot : 상태 트리의 루트값

- Nonce : 채굴 노드가 PoW채굴을 위해 찾은 논스값을 의미했으나 PoS 업그레이드 이후 0이다.
```
----------------------------------------

### Explorer에서 계정 주소를 입력하면 나오는 사항들 
```
- Txn Hash : 트랜잭션 해시

- Method : 실행한 함수, 단순 송금을 한 경우 Transfer 함수가 출력

- Block : 해당 트랜잭션이 담긴 블록의 숫자

- Age : 트랜잭션이 채굴된 시간

- From : 트랜잭션을 보낸 사람의 주소

- To : 받는 사람 주소

- Out,in : 해당 계정이 이더를 송금받은 경우 in 으로 표기되며, 해당 계정이 이더를 송긍한 경우에는 out으로 표기된다.

- Value : 보내는 이더양

- Txn Fee : 트랜잭션 수수료
```
