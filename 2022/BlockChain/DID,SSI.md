DID 활용

DID란 (Decentralized Idenity, 탈중앙 신원증명)

Decentralized Idenity는 데이터의 주권이 개개인에게 있고, 개개인의 데이터를 중앙화된 시스템을 거치지 않고 증명할 수 있는 기술을 의미한다.

DID는 분산원장기술 을 기반으로 사용자의 데이터를 저장하여 안전하고 편리하게 인증할 수 있도록 한다.

DID의 근간이 되는 개념으로 SSI로 SSI의 개념을 탈중앙화 방식의 신원증명을 통해 구현한 것이 DID이다.

SSI = Self Sovereign Identity 자기자신이 신원증명에 대한 권한을 갖도록 하는 개념

DID는 데이터 자장소(Registry), 데이터 제공자(provider) 인증기관(Certificate Authorities)을 분리하고, 탈중앙화 방식으로 동작하게 설계한다.

---------------------------------------------------------------

### 데이터 주권과 DID

#### W3C의 탈중앙 운동

DID 표준 등장의 기술적 맥락을 이해하기 위해서는 W3C내의 탈중앙 운동에 대한 이해가필요하다

World Wide Web을 창시한 팀 버너서리는 W3C 재단을 만들어 HTML을 표준화 한다.

W3C 활동의 본질적인 목적은 웹에서 사용자들이 상호간의 자유롭게 데이터를 주고받게 하기 위한것.

데이터 주권이 사용자 자신이 아닌 플랫폼 기업에 종속되는 현상 = 데이터 주권의 중앙화

---------------------------------------------------------------

### W3C와 DID

DID 구현의 가장 큰 걸림돌은 중앙화되지 않은 저장소에 개인의 신원을 증명할 수 있는 데이터를 보관하면서 동시에 데이터의 무결성과 보안성을 확보하는 것이다.

하지만 블록체인 기술이 등장하고 대중화되면서 DID를 구현할 때 탈중앙화된 방식을 사용해 사용자 신원 데이터를 저장하고 증명하는 방법을 못개하게 된다.

2016년 W3C 블록체인 워크샵에서도 블록체인 기반의 신원 인증을 표준화하자는 의견이 개진되었고, 

DID 워킹그룹이 공식적으로 결성되었다.



#### W3C 표준화 - DIDs(탈중앙화 식별자)

탈중앙화 식별자(Decentralized identifiers)

DIDs는 검증가능하고 탈중앙화된 디지털 신원을 위한 새로운 형식의 식별자이다. 흔히 우리가 사용하는 ID,Password로 생각하면된다. 누구나 DID 메소드로 자신의 주소를 만들 수 있다.

DIDs는 마스ㅓ키를 활용하여 만들 수 있다.



#### Identity(식별자)

식별자는 개인 혹은 단체 등을 구별할 수 있는 고유값이다.

DID 메소드는 특정 분산원장 또는 네트워크에서 DID와 관련된 DID 문서들을 생성, 읽기, 갱신 그리고 비활성화 하는 매커니즘이다.

---------------------------------------------------------------

### DID형식

did 는 3부분으로 구성된 간단한 문자열이다.

먼저 schema : DiDmethod : DID method-specific Identifier 형식이다.

즉 schema는 문자열이 해당 내용값이고, 이 주소가 did 스키마에 따른것임을 나타낸다.

Did method = did 메소드이름이고, did는 메소드별로 다르게 처리된다.

DID method-specific Identifier = 메소드 안에서 사용되는 고유 아이디

did 아이디가 주는 가장 중요한 정보는 DID 문서가 어디에 있는지 이다.

하지만 어떠한 개인정보도 저장하지 않는다는것.



### DIF(Decentralized Identity Foundation) 글로벌 조직

DIF는 전 세계의 사용자들이 DID를 더욱 쉽게 사용할 수 있도록 지원하기 위해 만든 조직이다.

DID 소유자가 Agent일 때, DID로 Universal Resolver에서 DID Document를 뽑아낼 수 있다.

DIF는 DID 표준을 만들며 DID를 활용하는 소프트웨어를 만드는 중요한 역할을 하고 있다.


DID 인증(Authentication)

DID 인증 절차

1. 회사에서 DID 소유권자에게 DID의 유무를 확인하기 위해 소유권자에게 challange를 신청한다.

2. 소유자인 나는 회사에 응답으로 인증정보가 포함된 DID를 전달한다.

3. 회사는 응답 받은 DID로 Universal Resolver에서 DID document를 가져온다.

4. Reponse 검사를 통해 응답한 소유가자 DID를 가지고 있는 것인지 확인 한다.


---------------------------------------------------------------

### SSI와 DID

DID는 SSI를 탈중앙화된 방식으로 구현한것

SSI는 블록체인을 기반으로 자신을 증명할 수 있는 정보를 스스로 관리 및 보관하고 신원 증명이 필요한 서비스를 이용할 때 인증정보를 제 3자에게 맡기는 것이 아닌 사용자가 직접 관리하도록 하여 데이터 주권을 사용자에게 돌려주는 기술


#### SSI를 구성하는 4가지 개념

DIDs(Decentralized identifier, 탈중앙화 식별자)

DIDs는 검증가능하고 탈중앙화된 디지털 신원을 위한 새로운 형식의 식별자이다. 누구나 DID 메소드로 자신의 주소를 만들 수 있으며, DID는 주소이면서 마스터키를 활용하여 만들 수 있다.

DID Auth

DID 소유자가 개인키를 가지고 있다는 것을 간단히 인증할 방법

이는 DIF에서 진행하고 있다.


#### DKMS(Decentralized Key Management System) 

신원을 증명하는 데 사용하는 개인키를 어떻게 관리할 것인가를 다룬다.


#### Verifiable Credentials(검증 가능한 크레덴셜)

아이디의 소유자가 어떤 것을 할 수 있는 자격을 갖추었음을 검증하는 방법을 다룬다.

SSI를 구현하기 위한 요소
```
1, Issuer : 발행자

Issuer는 신원정보를 발급하는 주체이다. Verifiable Credential 을발행하는 주체이며, 정보 주체의 요구에 의해 신원정보와 DID를 발급하는 기관이다. 발행자는 발급한 정보에 대해 신뢰할 수 있는 신원정보를 전달한다.


2.Holder: 소유자

Holder는 신원정보를 소유한 주체이다. 즉, 정보 주체로 DID를 활용하여 본인의 신원을 증명하고자 하는 사용자이다.


3.Verifier 검증자 

검증자는 신원정보를 검증하는 주체이다. 정보 주체인 Holder로부터 Verifiable Presentation을 받아 신원정보를 검증하는 주체이다.

DID로 신원을 확인한 후 검증자는 이 신원정보가 발급기관인 Issuer가 발급한 유효한 신원정봉니지, 검증 데이터 저장소를 통해 검증한다.

4.Verifiable Data Registry 블록체인 등 분산 저장소

정보 주체의 식별자와 Issuer의 인증서, 신원증명 해지내역, 신원 증명 시키마 등이 등록된 분산원장 기반의 데이터 무결성이 확보된 저장소이다.
```

---------------------------------------------------------------

### Verifiable Credentials(검증 가능한 크레덴셜)이란?


#### Credentials이란

Credential이란 신원 확인에 필요한 정보이다.

예를들어 일상생활에서 주민등록, 윤전면허 여권, 등에서 신원을 주장한다. 이것들은 물리적 Credential이다. 

하지만 디지털 세계에서는 물리적 신분증을 사용할 수 없기 때문에, 자신의 신원과 자격을 증명하고, Credential의 유효성을 보장하는 것이 어렵다. 이러한 문제를 해결하고자 나온 표준이 W3C의 Verifiable Credential Data Model 이다.

자기주권 신원 체계에서는 디지털 세계에서 개인의 신원을 증명할 수 있는 체계를 검증가능한 크리덴셜이라 한다.



### Verifiable Credential 의 구성요소
```
1. 클레임 :  디지털 세계에서는 신원정보는 데이터로 표현할 수 있다. 각 단위 데이터를 Claim이라고 하며,
아래와 같이 주체 - 속성 : 값 의 구조를 가진다. 예를 들어 Aㄹ나ㅡㄴ 주체의 이름이라는 속성은 박도형이라는 값을 가진다.라는 문장이 하나의 Claim이 된다. 또 이러한 클레임은 다른 Claim하고 결합하여  연결정보를 생성할 수 있다.

2. W3C 문서의 Credential : DID 체계에서는 Credential을 주체에 대한 하나 혹은 그 이상의 Claim으로 구성된 데이터 집합이라고 정의할 수 있다.
예를들어 주민등록증의 신원정보를 확인하여 생각해볼 수 있다. 이름, 주민등록번호, 발급일자, 주소, 주체
```

### Verifiable Credential 

탈중앙 신원체계에서는 Credential이 아닌 Verifiable Credential이라고 한다.

Credential Metadata : Credential을 해석할 수 있도록 설명해주는 메타데이터

Claim : 주체에 대한 Claim 집합

Proofs: Credential을 검증하도록 만드는 암호학적 요소들이 포함된 증명

이러한 기록은 분산원장 플랫폼을 기반으로 한다. 따라서 분산원잔 상에서 각 주체의 전자 서명을 확인하면서 궁극적으로 개인이 제시하고 있는 신원정보가 발급된 사실과 다르지 않다는 것을 검증할 수 있도록 한다.

그런 이유로 Verifiable credentail이라고 지칭한다.


먼저 Claim이 그래프 형식으로 구성되고 

또한 Verificable Credential이 크게 두개의 그래프로 구성된 것을 볼 수 있다.

먼저 Verifiable Credential Metadata 을 포함하는 Verifiable Credentail을 나타내고 

두번째 그래프는 Digital Signature인 Digital Proof를 나타낸다.


Verificable Credential 그래프 =>
```
1. Claim으로 정보를 확인하고 Digital Proof를 통해 검증
2. Issuer와 Holder의 Digital Signature 포함
3. 발급 내역 이 Data Registry에 쓰이며, 취소된 Credentail인지 아닌지 확인
4. 제대로 된 포맷인지, Schema 검증
```

이 과정을 통해서 
```
1. Issuer가 발급한 DID인지 진위여부
2. Holder의 DID인지 진위여부
3. 블록체인의 발급내역이 유효, 무효 여부
4. Schema 확인을 통해 형식이 맞는지를 확인
```

### Verifiable Presentation

SSI의 핵심은 프라이버시 보호이다.

주민등록증으르 VC로 만든다면 주민등록증의 모든 Claim들이 VC에 포함되어 있을 것이다.

그런데, 특정 상황에서 모든 정보를 제공해야 하는 경우는 거의 없다.

자기 주권신원에서는 최소한의 공개정보를 원칙으로 하여 증명이 필요한 정보들로만 구성된 새로운 형식이 필요하다.

그것이 바로 VP이다.

---------------------------------------------------------------

### Ecosystem of Verifiable Credential

하나 이상의 VC를 발급하고, 스마트폰 앱의 디지털 지갑에 VC를 저장한다. Verifier에게 증명하기 위해 VC중 필요한 정보를 VP로 구성한다.

검증자에게 VP로 검증한다.

여기서는 Data Registry로 블록체인을 사용한다.

---------------------------------------------------------------

### 자기신원인증 과정

#### Issuer 

	issuer 는 holder에 대한 검증가능한 크리덴셜 을 발급하여 전달한다.
	VC의 유효성을 확인할 수 있는 ID(Identifiers)와 Schema(스키마) 발급내역을 블록체인에 기록한다.


#### Holder
	
	issuer에게 VC를 받고, 자신이 증명서를 받았다는 내용과 스키마 정보를 가져온다.
	Verifier가 필요로 하는 정보를 담아 VP 형태로 보낸다.
	Issuer에게 받을 때는 VC형태, Verifier에게 보낼때는 VP형태이다.


#### Verifier

```
  * Verifier는 Holder에게 받은  VP내용을 확인한다.
		  * 블록체인에서 다음 내용을 확인한다.
			  - 발급내역
  			- Schema

		* VP 내용을 확인합니다.
			- Issuer DID
			- Holder DID
```

위 내용들을 검증하여 , VP내용의 사실여부를 검증한다.

