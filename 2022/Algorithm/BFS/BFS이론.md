## 알고리즘 

## 알고리즘 이론


## BFS

BFS 란 너비 우선 탐색으로(Breadth-First Search)의 약자로 지정 임의의 노드에서 시작해서 인접한 노드를 먼저 탐색하는 방법이다.

깊기보다 넓게 탐색하는 방법으로 두 노드 사이의 최단 경로 혹은 임의의 경로를 찾고 싶을 때 선택해서 사용한다.


### BFS의 특징

BFS의 특징은 다음과 같다.

    1.재귀적으로 동작하지 않는다.
    2. 노드 방문여부를 반드시 검사해야 한다.
    3. 선입선출 원칙으로 탐색(Queue)를 사용
    4. 프림알고리즘, 다익스트라 알고리즘과 비슷하다.
### 탐색 과정

탐색 과정은 다음과 같다.

![ex_screenshot](./img/BFS.png)

<br>


### 실제 적용 문제 예시

![ex_screenshot](./img/BFS2178.png)


### 문제풀이
```py
import sys
from collections import deque
input=sys.stdin.readline

n,m,start=map(int,input().split())
visited=[False]*(n+1)

graph=[[] for _ in range(n+1)]


for _ in range(m):
    a,b=map(int,input().split())
    graph[a].append(b)
    graph[b].append(a)

for i in range(len(graph)):
    graph[i].sort()

def dfs(start):
    print(start,end=' ')
    visited[start]=True
    for i in graph[start]:
        if not visited[i]:
            dfs(i)
            visited[i]=True

def bfs(start):
    q=deque([start])
    visited[start]=True
    while q:
        now=q.popleft()
        print(now,end=' ')
        for i in graph[now]:
            if not visited[i]:
                q.append(i)
                visited[i]=True
dfs(start)
visited=[False]*(n+1)
print()
bfs(start)
```
참고 자료 : https://gmlwjd9405.github.io/2018/08/15/algorithm-bfs.html
