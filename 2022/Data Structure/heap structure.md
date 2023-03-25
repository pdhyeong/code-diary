## Heap 이란

힙이란 

완전 이진 트리의 일종으로 우선순위 큐를 위하여 만들어진 자료구조이다.

여러 개의 값들 중에서 최댓값이나 최솟값을 빠르게 찾아내도록 만들어진 자료구조이다.

힙은 일종의 반정렬 상태(느슨한 정렬 상태) 를 유지한다.

큰 값이 상위 레벨에 있고 작은 값이 하위 레벨에 있다는 정도

간단히 말하면 부모 노드의 키 값이 자식 노드의 키 값보다 항상 큰(작은) 이진 트리를 말한다.

힙 트리에서는 중복된 값을 허용한다. (이진 탐색 트리에서는 중복된 값을 허용하지 않는다.)

힙에는 부모 노드 데이터의 우선순위가 더 높은 최소힙과 반대인 최대 힙이 존재하는데 아래에서는 최소힙에 대해서 구현해보겠다.

배열기반 데이터 저장과 연결 리스트 기반 데이터의 저장은 O(n)의 시간복잡도가 걸리지만

힙 기반 데이터의 저장 시간 복잡도는 O(log n)의 시간 복잡도를 가진다.

힙에서 리스트를 이용해서 마지막 위치에 데이터를 추가 하는것이 어렵기 때문에

보편적으로 배열을 사용한다.

아래는 최소힙에 대한 구현이다.

그림 자료와 자료들찾아보면서 공부했는데 진짜 머리 터지는줄 알았다 ㅋㅋ; 다시봐야할것 같다.

------------------------------------

## CODE

```C
#include <stdio.h>
#include <stdlib.h>

#define TRUE  1
#define FALSE  0

#define HEAP_LEN  100

typedef char HData;
typedef int (*PriorityComp)(HData d1,HData d2);

typedef struct _heapElem 
{
  PriorityComp comp;
  int numOfData;
  HData heapArr[HEAP_LEN];
} Heap;

// 우선순위 결정
// 가이드 라인 = 첫번쨰 인자가 우선순위가 더 높다면 0보다 큰값이 나온다.
int DataPriorityComp(char ch1,char ch2)
{
  return ch2-ch1;
}

void HeapInit(Heap * ph,PriorityComp pc) {
  ph->numOfData = 0;
  ph->comp = pc;
}

int HIsEmpty(Heap * ph) {
  if(ph->numOfData == 0) 
    return TRUE;
  else 
    return FALSE;
}
// 부모 노드의 인덱스 값
int GetParentIdx(int idx) {
  return idx/2;
}

// 왼쪽 자식 노드의 값
int GetLChildIdx(int idx) {
  return idx*2;
}
// 오른쪽 자식노드의 값
int GetRChildIdx(int idx){
  return GetLChildIdx(idx)+1;
}

// 자식노드 파악
int GetHiPriChildIdx(Heap *ph,int idx) {
  // 자식노드 없다면
  if(GetLChildIdx(idx) > ph->numOfData) {
    return 0;
  }
  // 왼쪽 자식 노드만 있다면
  else if(GetLChildIdx(idx) == ph->numOfData)
    return GetLChildIdx(idx);
  // 둘다 있다면
  else 
  {// 우선순위를 비교해서 두번째 인자가 더 크면(오른쪽이 우선순위)
    if(ph->comp(ph->heapArr[GetLChildIdx(idx)],ph->heapArr[GetRChildIdx(idx)]) < 0){
      return GetRChildIdx(idx);
    }
    else 
      return GetLChildIdx(idx);
  }
}
// 힙 데이터 저장
void HInsert(Heap * ph,HData data){
  int idx = ph->numOfData+1;

  // 데이터 생성 하고 힙구조 유지알고리즘
  while(idx != 1)
  {
    // 들어온 데이터와 부모노드와 비교하여 data가 우선순위가 높다면 idx값 잡아주기
    if(ph->comp(data,ph->heapArr[GetParentIdx(idx)]) > 0)
    {
      ph->heapArr[idx] = ph->heapArr[GetParentIdx(idx)];
      idx = GetParentIdx(idx);
    }
    else
      break;
  }
  ph->heapArr[idx] = data;
  ph->numOfData +=1;
}

// 데이터 삭제
HData HDelete(Heap *ph) {
  HData retData = ph->heapArr[1];
  HData lastElem = ph->heapArr[ph->numOfData];

  int parentIdx = 1;
  int childIdx;

  // 힙구조 유지 알고리즘
  while(childIdx == GetHiPriChildIdx(ph,parentIdx))
  {
    if(ph->comp(lastElem,ph->heapArr[childIdx]) >= 0)
      break;
    ph->heapArr[parentIdx] = ph->heapArr[childIdx];
    parentIdx = childIdx;
  }
  ph->heapArr[parentIdx] = lastElem;
  ph->numOfData -= 1;
  return retData;
}

int main() {
  Heap heap;
  HeapInit(&heap,DataPriorityComp);

  HInsert(&heap,'A');
  HInsert(&heap,'B');
  HInsert(&heap,'C');
  printf("%c \n",HDelete(&heap));

  HInsert(&heap,'A');
  HInsert(&heap,'B');
  HInsert(&heap,'C');
  printf("%c \n",HDelete(&heap));

  while(!HIsEmpty(&heap))
    printf("%c \n",HDelete(&heap));
  return 0;
}
```
