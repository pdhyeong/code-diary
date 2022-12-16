### web3 사용

Web3.js는 이더리움 블록체인과 Json RPC를 사용하여 interaction한다.

Json-RPC에는 다양한 모듈이 있는데 

Web3 - etc : 이더리움 블록체인과 스마트 컨트랙트 모듈

Web3-shh : P2P 커뮤니케이션과 브로드캐스트를 위한 위스퍼 프로토콜 모듈

Web3-bzz : 탈중앙화 파일 스토리지를 위한 스왐 프로토콜 모듈

Web3-utils : dApp 개발자를 위한 유용한 헬퍼 함수들을 모아둔 모듈


Window.ethereum - 공급자 객체

EIP-1139를 통해, 메타마스크와 같은 지갑 소프트웨어는 웹 페이지에 자바스크립트 객체형태로 자신의 API를 노출한다. 


------------------------------------------------------------

### express 사용한 EtherScan 테스트넷 정보확인하기
```JS
const Web3 = require('web3');
const rpcURL = "https://goerli.infura.io/v3/465c2b1ff006427f9514dd5e214e44f9"

const web3 = new Web3(rpcURL);

const account = "자신의 지갑주소";

// 블록확인 속도의 효율을 위해 비동기로 진행

async function getTransactionByAccount(account,startBlock,endBlock){
    const result = [];
  // start 블록부터 end블록까지
    while(startBlock < endBlock) {
        const promises = [];
      
      // getBlock()이라는 내장함수를 이용하면 block의 정보가 출력된다.
        const blockinfo =  await web3.eth.getBlock(startBlock++);
      // transaction 거래 내용들을 Hash한 값이 나온다
        const transactions = await blockinfo.transactions;
      
      // 그 값들을 순회하면서
        for(let el of transactions){
            let tx = web3.eth.getTransaction(el).then(txHash => {
              // 보내는 주소와 받는 주소가 나의 지갑주소와 같다면 해당 거래 해시값 출력
                if(txHash.from === account || txHash.to === account){
                    return (txHash);
                }
            }).catch(err => {
                return;
            })
            // promises 배열의 거래 해시값들을 담는다.
            promises.push(tx);
        }
      
      // 비동기처리
        Promise.allSettled(promises).then(subResult => {
          //promises로 담아온 값들을 순회
            subResult.forEach(el => {
              // Deploy한 값이 있다면
                if(el.value !== undefined) {
                  // 확인할 배열에 담는다.
                    result.push(el);
                }
            });
          // 배열에 담겼는지 확인
            console.log(result);
        });
    }
}

getTransactionByAccount(account,"시작 블록번호","~까지확인할 블록번호");
```

### 공식문서 링크 

[https://web3js.readthedocs.io/](https://web3js.readthedocs.io/en/v1.2.11/index.html)
