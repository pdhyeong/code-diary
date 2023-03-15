## 순차리스트

같은 타입의 변수들로 이루어진 유한한 집합 리스트이며 논리적주소와 물리적주소가 일치한다.

그리고 조회가 빠르다.

하지만 추가와 삭제 할때 해당 위치에서 모두 뒤로 밀어야한다.

------------------------------------

### CODE

```C
#include <stdio.h>
#include <stdlib.h>
#define LIST_LEN   100
typedef int LData;

typedef struct __ArrayList
{
  LData arr[100];
  int numOfData;
  int curPosition;
} ArrayList;

typedef ArrayList List;

// 초기화
void ListInit(List *plist){
  (plist->numOfData) = 0;
  (plist->curPosition) = -1;
  
}

// 삽입
void LInsert(List *plist,LData data) {
  if(plist->numOfData >= LIST_LEN){
    printf("저장 불가능");
    return;
  }
  plist->arr[plist->numOfData] = data;
  (plist->numOfData)++;
}

// 첫번째 데이터가 가리키는 메모리에 저장
int LFirst(List *plist,LData *pdata) {
  if(plist->numOfData == 0)
    return 0;
  (plist->curPosition) = 0;
  *pdata = plist->arr[0];
  return 1;
}
// 참조 다음 데이터로 이동
int LNext(List *plist,LData *pdata){
  if(plist->curPosition >= (plist->numOfData) - 1)
    return 0;
  (plist->curPosition)++;
  *pdata = plist->arr[plist->curPosition];
  return 1;
}
// 삭제 사실상 제일 핵심인것 같다.
LData LRemove(List *plist) {
  int rpos = plist->curPosition;
  int num = plist->numOfData;
  int i;
  LData rdata = plist->arr[rpos];
  
  // 모두 앞으로 떙긴다
  for(i = rpos;i<num-1;i++){
    plist->arr[i] = plist->arr[i+1];
  }
  // 현재의 위치를 낮추고
  (plist->numOfData)--;
  (plist->curPosition)--;
  return rdata;
}
// 현재 갯수
int LCount(List *plist) {
  return plist->numOfData;
}
int main() {
  List list;
  int data;
  ListInit(&list);

  LInsert(&list,123); LInsert(&list,127);
  LInsert(&list,294); LInsert(&list,183);
  LInsert(&list,654);

  printf("현재 데이터의 수: %d \n",LCount(&list));

  if(LFirst(&list,&data))
  {
    printf("%d ",data);

    while(LNext(&list, &data)) printf("%d ",data);
  }
  printf("\n\n");

  if(LFirst(&list,&data))
  {
    if(data == 294)
      LRemove(&list);
    
    while(LNext(&list, &data)) 
    {
      if(data == 294) 
        LRemove(&list);
    }
  }

  printf("현재 데이터의 수 %d \n",LCount(&list));

 if(LFirst(&list,&data))
  {
    printf("%d ",data);
    
    while(LNext(&list, &data)) 
    {
      printf("%d ",data);
    }
  }

  printf("\n\n");
  
  return 0;
}
```
