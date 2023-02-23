### docker 컨테이너 파일 내려받기

```
docker pull <container name>
```


### 컨테이너 실행 

```
docker run [OPTION] IMAGE[:TAG] [COMMAND]
$ docker run -i -t ubuntu:16.04 /bin/bash
```

### 포어그라운드 실행 

```
$ docker run -i -t ubuntu:16.04 bin/bash
```


### 데몬으로 실행

```
docker run -d -p 80:80 nginx
```


### 포트 포워딩

```
$ docker run -d --name my_nginx -p 80:80 -p 3306:3306 nginx:latest
```

### 정지 삭제한번에

```
docker rm -f my_ubuntu 
```

### 목록에 있는 컨테이너 삭제

```
docker container prune
```


### 컨테이너 이름 할당 

```
docker run -i -t --name my_ubuntu ubuntu:16.04 /bin/bash
```

### 컨테이너 정지

```
docker stop my_ubuntu
```

### 컨테이너 삭제

```
docker rm my_ubuntu
```

### 컨테이너 정보확인

```
docker inspect my_ubuntu
```

### 도커 이미지 목록

```
docker images
```

### 도커 이미지 삭제

```
docker rmi IMAGE[:TAG]
$ docker rmi ubuntu:16.04
```
