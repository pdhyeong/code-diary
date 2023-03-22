## 큐(Queue)

큐 또한 스택 처럼 우리에게 매우 익숙한 알고리즘을 가진 자료구조이다.

학창시절 모두 급식을 먹기 위해 줄을 서서 먹었던 기억이 있을 것이다.

먼저 온 사람이 먼저 배식 받는 것처럼, 큐는 먼저 들어온 데이터가 먼저 처리 되는 선입선출 구조를 가진 자료구조이다.

이를 영어로 FIFO(First-in, First-Out)라고 한다.

------------------------------------

## 원형 큐

배열을 기반으로 한 큐에서는 크기의 한계를 정해두고 사용하기 때문에

앞쪽부터 뒤로 채우고 앞쪽 부터 지워가면 이후에 

Dequeue연산으로 앞쪽으로 데이터를 삭제해가면 공간의 낭비가 생기기 때문에

추상적으로 다시 배열을 돌린다고 생각하여 원형 큐라고 한다.

하지만 진짜 빈공간없이 돌려보면 이는 앞쪽을 가리키는 Front와 끝을 가르키는 Rear를 사용해서 구별하기 힘들어진다는 것을 그림을 그려보면 알 수있다. (막상 나는 아이패드를 잃어버려서 노트에만 그렸다 ^^..)

**그렇다면 나올 수 있는 해결방법은 배열을 꽉 채워서 전부 사용하지 않는다** 라는 해결을 생각해볼수 있다.

이는 많이들 사용하는 해결방법이라고 한다.

배열의 길이가 N이라면 데이터가 N-1개 채워졌을 때, 이를 꽉 찬 것으로 간주하는 방법이다.

저장공간 하나를 낭비하게 되지만 이로 인해서 문제하나가 해결되는 것이니 이득이 더 많다고 생각할 수 있다.

------------------------------------------------

## CODE

```C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TRUE  1
#define FALSE  0

#define QUE_LEN  100

typedef int Data;

typedef struct _cQueue 
{
  int front;
  int rear;
  Data queArr[QUE_LEN];
} CQueue;

typedef CQueue Queue;

void QueueInit(Queue *pq) {
  pq->front = 0;
  pq->rear = 0;
  
}
int QIsEmpty(Queue *pq) {
  if(pq->front == pq->rear) 
    return TRUE;
  else 
    return FALSE;
}

int NextPosIdx(int pos) {
  if(pos == QUE_LEN-1)
    return 0;
  else
    return pos + 1;
}

void Enqueue(Queue *pq,Data data) {
  if(NextPosIdx(pq->rear) == pq->front){
    printf("Queue Memory Error\n");
    exit(-1);
  }

  pq->rear = NextPosIdx(pq->rear);
  pq->queArr[pq->rear] = data;
}

Data Dequeue(Queue *pq) {
  if(QIsEmpty(pq)){
    printf("Queue Memory Error\n");
    exit(-1);
  }
  pq->front = NextPosIdx(pq->front);
  return pq->queArr[pq->front];
}
Data QPeek(Queue *pq) {
  if(QIsEmpty(pq)){
    printf("Queue Memory Empty\n");
    exit(-1);
  }
  // NextPosIdx를 사용하는 이유 = front를 변경 시키면 이후 연산에서 복잡해 지기 때문에 front의 앞의 값만 받아오게 하기 위해0
  return pq->queArr[NextPosIdx(pq->front)];
}

int main() {
  Queue q;
  QueueInit(&q);

  Enqueue(&q,1);Enqueue(&q,2);
  Enqueue(&q,3);Enqueue(&q,4);
  Enqueue(&q,5);Enqueue(&q,6);

  printf("앞쪽 노드 값 = %d \n",QPeek(&q));

  // 첫 번째 노드 삭제
  printf("첫번째 노드 삭제 %d\n",Dequeue(&q));

  // 이후 앞 노드 값
  printf("앞쪽 노드 값 = %d \n",QPeek(&q));
  while(!QIsEmpty(&q))
    printf("%d ",Dequeue(&q));
  return 0;
}
```
