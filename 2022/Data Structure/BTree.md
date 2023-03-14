## 이진트리

이진트리란 자식노드가 최대 두 개인 노드들로 구성된 트리입니다.

이진트리에는 정이진트리(full binary tree), 완전이진트리(complete binary tree), 균형이진트리(balanced binary tree) 등이 있습니다.


### 간단한 ADT

```
BTreeNode = 왼쪽 오른쪽 방향을 가지는 노드
BTData = int

MakeTreeNode(void) : 이진트리 노드 생성

GetData(BTreeNode * bt) : 노드에 저장된 데이터반환

SetData(BTreeNode * bt, BTData data): data로 전달된 값 저장

GetLeftSubTree(BTreeNode * bt) : 왼쪽 서브 트리의 주소값 반환

GetRightSubTree(BTreeNode * bt) : 오른쪽 서브 트리의 주소값 반환

MakeLeftSubTree(BTreeNode * main,BTreeNode * sub) : 왼쪽 서브트리를 연결한다.

MakeRightSubTree(BTreeNode * main,BTreeNode * sub) : 오른쪽 서브트리를 연결한다.
```

### CODE

```C
#include <stdio.h>
#include <stdlib.h>

typedef int BTData;

typedef struct _bTreeNode 
{
BTData data;
struct _bTreeNode * left;
struct _bTreeNode * right;
} BTreeNode;

// 노드 생성
BTreeNode * MakeBTreeNode(void) {
BTreeNode * nd = (BTreeNode *)malloc(sizeof(BTreeNode));
nd -> left = NULL;
nd -> right = NULL;
return nd;
}

// 데이터 값 반환
BTData GetData(BTreeNode * bt)
{
  return bt->data;
}

// 데이터 세팅
void SetData(BTreeNode * bt,BTData data)
{
  bt->data = data;
}

// 왼쪽 서브트리로 이동
BTreeNode * GetLeftSubTree(BTreeNode * bt) 
{
  return bt->left;
}

// 오른쪽 서브트리로 이동
BTreeNode * GetRightSubTree(BTreeNode * bt) {
  return bt->right;
}

// 새 서브 트리 생성
void MakeLeftSubTree(BTreeNode * main,BTreeNode * sub)
{
  if (main->left != NULL) free(main->left);
  
  main->left = sub;
}

// 오른쪽 서브 트리 생성
void MakeRightSubTree(BTreeNode * main,BTreeNode * sub)
{
  if (main->right != NULL) free(main->right);
  
  main->right = sub;
}

int main() {
    
  BTreeNode * bt1 = MakeBTreeNode();
  BTreeNode * bt2 = MakeBTreeNode();
  BTreeNode * bt3 = MakeBTreeNode();
  BTreeNode * bt4 = MakeBTreeNode();
  
  SetData(bt1,1);
  SetData(bt2,2);
  SetData(bt3,3);
  SetData(bt4,4);
  
  MakeLeftSubTree(bt1,bt2);
  MakeRightSubTree(bt1,bt3);
  MakeLeftSubTree(bt2,bt4);

  printf("루트노드 %d \n", GetData(bt1));
  printf("루트노드%d의 왼쪽 자식노드 %d\n", GetData(bt1),GetData(GetLeftSubTree(bt1)));
  printf("루트노드%d의 오른쪽 자식노드 %d \n", GetData(bt1),GetData(GetRightSubTree(bt1)));
  printf("왼쪽 자식노드%d의 왼쪽 노드 %d \n",GetData(GetLeftSubTree(bt1)), GetData(GetLeftSubTree(GetLeftSubTree(bt1))));
  return 0;
}
  
```
