## 스택

스택은 우리 주변에서 쉽게 찾을 수 있는 알고리즘을 띈다.

예를 들어 쌓아올려진 상자 더미나 쟁반위에 접시들을 예로 들 수 있다.

이런 것들은 아래에서 위로 쌓아 올렸으면 위에서 부터 처리해야 처리가 가능하다는 것을 알 수 있다.

이를 후입선출 이라고 하고 영어로는 LIFO(Last-in,First-out)이라고 한다.

연결 리스트로도 구현이 가능하고 배열로도 가능하다.

먼저 간단하게 배열로 구현해보겠다.

--------------------------------------------

### CODE

```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE  1
#define FALSE  0
#define STACK_LEN  100

typedef int Data;

typedef struct _arrayStack
{
  Data stackArr[STACK_LEN];
  int topIndex;
} ArrayStack;

typedef ArrayStack Stack;

// 스택 초기화
void StackInit(Stack *pstack) {
  pstack->topIndex = -1;
}
// 스택이 비었는지 확인
int SIsEmpty(Stack *pstack) {
  if(pstack->topIndex == -1) 
    return TRUE;
  else
    return FALSE;
}
// 데이터 삽입
void SPush(Stack *pstack,Data data) {
  (pstack->topIndex)++;
  pstack->stackArr[pstack->topIndex] = data;
}

// 데이터 삭제하고 값 반환
Data SPop(Stack *pstack) {
  int rIdx;

  if(SIsEmpty(pstack)){
    printf("Stack is Empty!\n");
    exit(-1);
  }
  rIdx = pstack->topIndex;
  (pstack->topIndex)--;

  return pstack->stackArr[rIdx];
}
// 마지막 요소 반환 
Data SPeek(Stack *pstack) {
  if(SIsEmpty(pstack)){
    printf("Stack is Empty\n");
    exit(-1);
  }
  return pstack->stackArr[pstack->topIndex];
}
int main() {
  Stack stack;
  Stack * realstack = &stack;
  StackInit(realstack);

  SPush(realstack,1); SPush(realstack,2);
  SPush(realstack,3); SPush(realstack,4);
  SPush(realstack,5); SPush(realstack,6);


  printf("스택 데이터 위에서 부터 빼기\n");
  while(!SIsEmpty(realstack)) {
    printf("%d ",SPop(realstack));
  }
  
  return 0;
}
```
