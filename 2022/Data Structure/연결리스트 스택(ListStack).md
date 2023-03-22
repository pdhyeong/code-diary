## 스택 

스택은 후입선출 이므로 새 노드가 생성되면 전 노드를 가르키고 head는 새로 생긴 노드를 가리키는 구조를 만들면 간단하게 구현이 가능하다.

------------------------------------------------------------

## CODE

```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE  1
#define FALSE  0

typedef int Data;

typedef struct _node
{
  Data data;
  struct _node * next;
} Node;

typedef struct _listStack
{
  Node * head;
} ListStack;


typedef ListStack Stack;

// 스택 초기화
void StackInit(Stack *pstack) {
  pstack->head = NULL;
}
// 스택이 비었는지 확인
int SIsEmpty(Stack *pstack) {
  if(pstack->head == NULL)
    return TRUE;
  else
    return FALSE;
}
// 데이터 삽입
void SPush(Stack *pstack,Data data) {
  Node * newNode = (Node*)malloc(sizeof(Node));

  newNode->data = data;
  newNode->next = pstack->head;

  pstack->head = newNode;
}

// 데이터 삭제하고 값 반환
Data SPop(Stack *pstack) {
  Data rdata;
  Node *rnode;

  if(SIsEmpty(pstack)){
    printf("Stack is Empty\n");
    exit(-1);
  }

  rdata = pstack->head->data;
  rnode = pstack->head;

  pstack->head = pstack->head->next;
  free(rnode);
  return rdata;
}
// 마지막 요소 반환 

Data SPeek(Stack *pstack) {
  if(SIsEmpty(pstack)){
    printf("Stack is Empty\n");
    exit(-1);
  }
  return pstack->head->data;
}

int main() {
  Stack stack;
  Stack *pstack = &stack;

  StackInit(pstack);

  // 데이터 삽입
  SPush(pstack,1);SPush(pstack,2);
  SPush(pstack,3);SPush(pstack,4);
  SPush(pstack,5);SPush(pstack,6);
  SPush(pstack,7);SPush(pstack,8);

  printf("마지막 데이터는 %d \n",SPeek(pstack));

  // 데이터 삭제 및 출력
  while(!SIsEmpty(pstack)){
    printf("%d ",SPop(pstack));
  }
  return 0;
}
```
