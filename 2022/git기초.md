### git

git이란 분산 버전관리 시스템(Distributed Version Control Sysytems)로 사용자들 간에 파일 작업을 조율하는데 사용된다.

 

 

git의 장점

- git의 장점은 오프라인에서도 작업이 가능하다는 것과, 속도가 빠르고 서버의 영향을 받지 않고 개발을 수월하게 할 수 있다는 것이다.

- 많은 개발자가 git을 사용하므로 수많은 개발자 툴이 git을 많이 지원한다.

 

 

git의 단점

- 한 번에 여러 브랜치나 여러 태그에 걸쳐서 커밋 할 수 없다. 다른 브랜치와 병합 할 때 충돌의 원인이 될 수도 있다.

- 커밋 ID를 기억하기 어렵고 사실상 항상 복사 붙여넣기를 해야한다.

 

 

github

 

github이란 git을 사용하는 프로젝트를 지원하는 웹 호스팅 서비스 이다.

 

많은 오픈 소스들로 인해 오픈소스들의 성지라고 불리며, 협업을 훨씬 원활하게 해주는 서비스 이다.

 

Local Repository : 내 컴퓨터의 저장소

Remote Repository : 원격 온라인 서버상의 저장소

 

 

기본 git 명령어

 

git init : 일반적인 폴더에 git repository를 추가하기 위해 사용하는 명령어이다.

git clone : Local Repositoey의 파일을 Remote Repository로 복사 한다.

git add 파일명 : 해당 파일을 commit 할 수 있는 상태로 만들어 주는것.

git status : 문자 그대로 현재 git의 상태를 의미한다. untracked 파일과 tracked 파일을 파악한다.

git restore 파일명 : 처음 Clone 했던 상태로 되돌리는 명령어이다.

git commit -m '커밋메시지' : commit할 수 있는 상태가 된 파일을 Repository로 ' '안에 문자를 남기며 commit 하는 명령어이다.

git reset HEAD^: Local Repository에 commit한 최신기록을 reset 하는 명령어.

git push 닉네임 branch명 : 변경 사항을 Repository로 push하는 명령어이다.

git log : 현재까지 commit된 로그들을 확인하는 명령어이다.
