### ERC-721 = NFT


ERC-721는 대체 불가능한 토큰으로, 각각 구분할 수 있는 토큰을 의미한다.

EIP-721 의 결과로 생겨났고, 공식 문서에서는 EIP-721로 다음과 같이 공식문서에 정리되어 있다.

A standard interface for non-fungible tokens, also known as deeds
(증서로도 알려져 있는, 대체 불가능ㅎ나 토큰을 위한 표준 인터페이스)

여기서 가장 핵심은  non-fungible tokens로 NFT이다.

대체 불가능한 토큰 이라는 뜻으로

```
NFTs can represent ownership over digital or physical assets.
We considered a diverse universe of assets, and we know you will dream up many more
```

NFT는 디지털 혹은 물리적 자산의 소유권을 주장할 수 있다. 우리는 다양한 자산의 종류를 고려했고, 우리는 더 많은 꿈을 꾸게 될 것이다.

```
Physical property - houses, unique artwork.

Virtual collectable - unique pictures of kittens, collectable card

Negative value assets - Lonas, burdens and other responsibilities

In general, all houses are distinct(구별) and no two kittens are alike.

NFTs are distinguishable and you must track the ownership of each one separately
```

물리적 자산 - 주택, 고유한 예술 작품

가상 공간의 수집 자산 - 고유 고양이 사진 , 수집 가능한 카드

부정 자산 - 대출, 의무와 책임


No two 명사 be + alike = 두개의  ~는 같지 않다.

일반적으로 모든 주택은 구별되고, 서로 다른 두 고양이는 같지 않다. NFT는 구별가능하며,  각각의 소유권은 별도로 추적해야한다.

ERC-721는 인터페이스에 따라 구현된 토큰인 NFT는 각가의 토큰 하나하나가 고유하고 식별할 수 있다.

--------------------------------------------------------

### NFT로 소유권 증명하기


예술 작품은 실제로 삽화나 수기로 작성한 진품확인서 (Certificate of Authenticity)를 소유한다.

디지털은 복붙이 되기때문에 증명이 어려우니 NFT를 사용한 사례가 있다.


--------------------------------------------------------

### ERC-20과 ERC-721의 차이

이더리움에는 이미 ERC-20 이라는 토큰이 있는데 왜 또 다른 토큰을 표준을 지정할 것일까

EIP-721의 Motivation에서는 이렇게 말한다.

```
This standard is inspired by the ERC-20.
Token standard and builds on two years of experience since EIP-20 was created.
EIP-20 is insufficient for tracking NFTs because each asset is distinct (non-figible) whereas each of quantify of tokens is identail (fungible)
```
이 표준은 ERC-20으로부터 영감을 얻었고, EIP-20이 만들어지고 2년간의 경험을 기반으로 한다.  EIP는 NFT를 추적하기에는 불충분한데, 각 자산은 구별되는 반면 각 토큰의 수량은 동일 가지고 있다.

화폐처럼 ERC-20 토큰 표준으로 발행되는 토큰은 완전히 같은 가치를 가지며, 하나의 토큰이 다른 토큰을 대체 할 수 있다.

반면 ERC-721은 표준으로 발행되면 non fungible 하다.

NFT가 가지는 성질은 고유하며, 서로 다른 두 NFT가 갖는 가치가 다른 것이다.

--------------------------------------------------------

### ERC-721의 9개의 표준 함수

```
balanceOf = owner가 소유한 NFT의 갯수 반환

ownerOf = 특정 tokenId를 가진 NFT의 소유주 주소를 반환

approve = 특정 계정에게 자산이 소유한 NFT 하나를 사용하도록 허용

getApproved = 특정 NFT가 다른 계정에게 사용 승인되었는지의 여부 반환

setApprovalForAll = 특정 계정에게 자신이 소유한 모든 NFT에 대한 사용을 허용

isApprovedForAll = owner가 특정 계정에게 자신의 모든 NFT에 대한 사용을 허용했는지의 여부 반환

transferFrom = NFT 소유권 전송

safeTransferFrom = 받는 주소가 NFT를 받을 수 있는지 확인 후 NFT 소유권 전송
```

이 표준 함수를 포함한 컨트랙트를 통해 민팅된 토큰이 바로 NFT 이다.

--------------------------------------------------------

### transferFrom() 함수가 가진문제


transferFrom() 은 받은 주소가 NFT를 사용할 수 있는지 확인하지 않고 보낸다.



A 컨트랙트에서 park에게 주소로 NFT를 보내는 경우



A 컨트랙트에서 park의 주소 0x1234로 NFT를 보낸다면 어떻게 될까

A 컨트랙트 내부에 해당 NFT의 token Id의 owner가 0x1234로 설정될 것이다.



A컨트랙트에서 B컨트랙트의 주소로 NFT를 보내는 경우

사용자 계정 뿐만 아니라 스마트 컨트랙트 역시 계정을 가지고 있다.

A 컨트랙트에서 B 컨트랙트 주소 0x5678로 NFT를 보낸다고 했을때

A 컨트랙트 내부에 해당 NFT의 token ID의 owner가 0x5678로 설정될 것이다.

그러면 이 후에는 어떻게 될까

컨트랙트계정은 코드에 의해 동작한다. 김코딩의 예시에서는 김코딩이 A 컨트랙트의 함수를 호출 할 수 있었지만, 컨트랙트 계정에서는 

A 컨트랙트의 함수 transferFrom()호출을 수행하는 코드가 없다면 수신 받은 NFT를 사용할 수 없다

수신받은 NFT를 다루는 코드가 들어있지 않다고 가정하면

NFT의 소유권을 B에게 넘어왔지만 B 컨트랙트에서는 이 NFT를 다룰 수 있는 코드가 없어서 NFT를 사용할 수 없게 된다.

존재하지만 잠겨서 어디에서도 쓸수 없게된다.

그래서 A 컨트랙트는 B 컨트랙트가 NFT를 다룰준비가 되었는지 확인할 필요가 있는데

이것을 위한 함수가 safeTrsansferFrom()이다. 

