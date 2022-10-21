## DML,DDL,DCL


### DML

DML은 Data manipulation Language로 말그대로 데이터 조작어 이다.

정의되어 있는 데이터를 선택, 삽입,수정,삭제를 할때 사용한다.

#### 예시

```
SELECT : 데이터를 조회하거나 검색하기 위한 명령어
INSERT : 데이터베이스의 테이블에 들어는 데이터에 변형을 가하는 종류의 명령어(삽입)
UPDATE : 데이터베이스의 테이블에 들어는 데이터에 변형을 가하는 종류의 명령어(수정)
DELETE : 데이터베이스의 테이블에 들어는 데이터에 변형을 가하는 종류의 명령어(삭제)
```

-------------------------

### DDL

DDL은 Data Definition Laguage로 데이터 정의어 이다.

구조를 생성하거나 정의하는데 사용된다.

```
CREATE : 구조를 생성하는 정의어 이다.
ALTER : 생성되어 있는 구조를 변경한다.
DROP : 생성되어 있는 구조를 변경한다.
TRUNCATE : 구조의 이름을 변경한다.
```

-----------------------------

### DCL 

DCL은 Data Control Language로 데이터베이스에 접근하고 객체들을 사용하는 권한을 주거나 회수 하는 명령어.

```
GRANT : 권한 부여
REVOKE : 권한 회수
```

------------------------------

### TCL

추가로 TCL이라고 Transaction Control Language로 작업단위를 묶어서 조작된 결과를 별도로 제어하는 명령어도 존재한다.

COMMIT , ROLLBACK , SAVEPOINT 등
