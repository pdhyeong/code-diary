docker 컨테이너 파일 내려받기

```
docker pull <container name>
```



```
docker run [OPTION] IMAGE[:TAG] [COMMAND]
$ docker run -i -t ubuntu:16.04 /bin/bash
```

포어그라운드 실행 
```
$ docker run -i -t ubuntu:16.04 bin/bash
```


데몬으로 실행

```
docker run -d -p 80:80 nginx
```


포트 포워딩

```
$ docker run -d --name my_nginx -p 80:80 -p 3306:3306 nginx:latest
```

정지 삭제한번에

```
docker rm -f my_ubuntu 
```


