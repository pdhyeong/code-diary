## 트리의 순회

이진 트리를 대상을 ㅗ하는 대표적인 순회의 세가지 방법이 있다.

```
* 전위 순회(Preorder Traversal) = 루트노드 먼저
* 중위 순회(Inorder Traversal) = 루트노드를 중간에
* 후위 순회(Postorder Traversal) 루트 노드를 마지막에
```

위와 같은 방법으로 순회 하고 이것은 재귀적으로 순회가 가능하다.

------------------------------

## CODE

```C
#include <stdio.h>
#include <stdlib.h>

typedef int BTData;
typedef void (*VisitFuncPtr) (BTData data);

typedef struct _bTreeNode 
{
  BTData data;
  struct _bTreeNode * left;
  struct _bTreeNode * right;
} BTreeNode;

// 노드 생성
BTreeNode * MakeBTreeNode(void){
  BTreeNode * newNode = (BTreeNode *)malloc(sizeof(BTreeNode));
  newNode->left = NULL;
  newNode->right = NULL;

  return newNode;
}
// 노드 저장된 데이터반환
BTData GetData(BTreeNode *bt) {
  return bt->data;
}
// 노드에 데이터 저장
void SetData(BTreeNode * bt,BTData data) {
  bt->data = data;
}
// 왼쪽 서브트리 주소값 반환
BTreeNode * GetLeftSubTree(BTreeNode *bt) {
  return bt->left;
}
// 오른쪽 서브 트리 주소값 반환
BTreeNode * GetRightSubTree(BTreeNode * bt) {
  return bt->right;
}
// 왼쪽 서브트리의 연결
void MakeLeftSubTree(BTreeNode * main,BTreeNode * sub) {
  if(main->left != NULL)
    free(main->left);

  main->left = sub;
}
// 방문후 데이터 출력
void ShowData(int data){
  printf("%d ",data);
}
// 오른쪽 서브트리의 연결 
void MakeRightSubTree(BTreeNode * main,BTreeNode * sub) {
  if(main->right != NULL)
    free(main->right);
  
  main->right = sub;
}

void PreorderTraverse(BTreeNode * bt,VisitFuncPtr action) {
  if(bt == NULL) return;
  action(bt->data);
  PreorderTraverse(bt->left,action);
  PreorderTraverse(bt->right,action);
}
void InorderTraverse(BTreeNode * bt,VisitFuncPtr action){
  if(bt == NULL) return;
  InorderTraverse(bt->left,action);
  action(bt->data);
  InorderTraverse(bt->right,action);
}
void PostorderTraverse(BTreeNode * bt,VisitFuncPtr action){
  if(bt == NULL) return;

  PostorderTraverse(bt->left,action);
  PostorderTraverse(bt->right,action);
  action(bt->data);
}
int main() {

  BTreeNode * bt1 = MakeBTreeNode();
  BTreeNode * bt2 = MakeBTreeNode();
  BTreeNode * bt3 = MakeBTreeNode();
  BTreeNode * bt4 = MakeBTreeNode();
  BTreeNode * bt5 = MakeBTreeNode();
  BTreeNode * bt6 = MakeBTreeNode();
  BTreeNode * bt7 = MakeBTreeNode();

  SetData(bt1, 1);
  SetData(bt2, 2);
  SetData(bt3, 3);
  SetData(bt4, 4);
  SetData(bt5, 5);
  SetData(bt6, 6);
  SetData(bt7, 7);

  MakeLeftSubTree(bt1,bt2);
  MakeRightSubTree(bt1,bt3);
  MakeLeftSubTree(bt2,bt4);
  MakeLeftSubTree(bt4,bt7);
  MakeRightSubTree(bt4,bt5);
  MakeLeftSubTree(bt5,bt6);

  printf("중위순회\n");
  InorderTraverse(bt1,ShowData); // 7 4 6 5 2 1 3 
  printf("\n");
  printf("전위순회\n");
  PreorderTraverse(bt1,ShowData);//1 2 4 7 5 6 3 
  printf("\n");
  printf("후위 순회\n");
  PostorderTraverse(bt1,ShowData); // 7 6 5 4 2 3 1
  return 0;
}
  
```
