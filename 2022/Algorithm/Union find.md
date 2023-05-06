## 유니온 파인드

유니온 파인드는 합집합으로 그래프가 어떠한 정점에서 어떠한 정점 두개가 서로 연결되어 있는지나, 같은 부모 인가를 찾을 떄 사용할 수 있다.

## CODE

```py
import sys
sys.setrecursionlimit(100000)

def getparent(parent,x):
  if parent[x] == x: 
    return x
  parent[x] = getparent(parent,parent[x])
  return parent[x]

# 두 부모를 노드를 합치는 함수
def unionparent(parent,a,b):
  a = getparent(parent ,a)
  b = getparent(parent, b)
  if a < b:
    parent[b] = a
  else:
    parent[a] = b
# 같은 부모를 가지는지 확인

def findparent(parent,a,b):
  a = getparent(parent,a)
  b = getparent(parent,b)
  if a == b: 
    return 1
  return 0

parent = []

for i in range(11):
  parent.append(i)

unionparent(parent,1,2)
unionparent(parent,2,3)
unionparent(parent,3,4)
unionparent(parent,4,5)
unionparent(parent,5,6)
unionparent(parent,6,7)

print(findparent(parent,1,5))
print(findparent(parent,1,10))
print(parent)
```
