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

![image](https://user-images.githubusercontent.com/71219602/168030043-3b9e1c80-fa53-4cb4-9021-f0cf699ac21d.png)


<br>


### 실제 적용 문제 예시

![image](https://user-images.githubusercontent.com/71219602/168030198-57e0f3d8-3b68-4c5d-b0cc-b53b5eba2e1f.png)



### 문제풀이
```py
# 미로 탐색
from collections import deque
dx = [0,0,-1,1] #상하좌우 설정
dy = [1,-1,0,0]

graph = [] # 빈 그래프

n,m = map(int,input().split())
for i in range(n): # 열 횟수 (반복)
    graph.append(list(map(int,input()))) # 이렇게 선언하면 공백없이 들어간다.

def bfs(x,y):
    queue = deque() # 큐생성
    queue.append((x,y)) #큐 안에 x,y 값(즉 먼저 확인하는 값)
    while queue: # 큐가 비어있을때 까지
        x,y = queue.popleft() # 두개의 값을 뺀다
        for i in range(4):# 상하좌우 확인
            nx = x + dx[i]
            ny = y + dy[i]
            if nx < 0 or ny < 0 or nx >= n or ny >= m:
                continue
            if graph[nx][ny] == 0: # 미로의 벽 (0) 에 부딪히면 다시 
                continue
            if graph[nx][ny] == 1: # 만약 1에 걸리면 그쪽으로 간다
                graph[nx][ny] = graph[x][y] + 1 # 총 가는 비용을 구하기 위해 비용 축적
                queue.append((nx,ny)) # 큐에 삽입하고 다시 반복문으로 간다.
    return graph[n-1][m-1] # 축적되어서 온 값 맨 오른쪽 아래 
print(bfs(0,0)) # 시작지점은 (0,0)
```
참고 자료 : https://gmlwjd9405.github.io/2018/08/15/algorithm-bfs.html
