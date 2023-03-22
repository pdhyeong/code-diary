## 연결리스트 큐

연결리스트 기반의 큐는 이미 연결리스트를 많이 구현 해봐서 머리속으로 로직이 생각이 된다면 어렵지 않을 것이다.

양방향 리스트 보다 어렵지 않고 이미 원형 큐로 큐의 동작 방식을 이해하고 있으니까 ^_^

Front와 Rear라는 head와 tail의 역할을 하는 노드를 만들어 주고 

데이터를 추가하고 Rear가 추가한 새 노드를 가르키고 Front는 삭제하는 Dequeue연산을 하면서 앞쪽부터 데이터를 삭제한다.

------------------------------------------------

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


typedef struct _lQueue
{
  Node * front;
  Node * rear;
} LQueue;

typedef LQueue Queue;

void QueueInit(Queue *pq) {
  pq->front = NULL;
  pq->rear = NULL;
}
int QIsEmpty(Queue *pq) {
  if(pq->front == NULL)
    return TRUE;
  else
    return FALSE;
}
void Enqueue(Queue *pq,Data data) {
  Node *newNode = (Node *)malloc(sizeof(Node));
  newNode->next = NULL;
  newNode->data = data;

  if(QIsEmpty(pq))
  {
    pq->front = newNode;
    pq->rear = newNode;
  }
  else 
  {
    pq->rear->next = newNode;
    pq->rear = newNode;
  }
}

Data Dequeue(Queue *pq) {
  Node *delNode;
  Data retData;
  
  if(QIsEmpty(pq)) {
    printf("Queue Memory Error\n");
    exit(-1);
  }

  delNode = pq->front;
  retData = delNode->data;
  pq->front = pq->front->next;

  free(delNode);
  
  return retData;
}
Data QPeek(Queue *pq) {
  if(QIsEmpty(pq)) {
    printf("Queue Memory Error\n");
    exit(-1);
  }
  
  return pq->front->data;
}

int main() {

  Queue q;
  QueueInit(&q);

  Enqueue(&q,1);Enqueue(&q,2);
  Enqueue(&q,3);Enqueue(&q,4);
  Enqueue(&q,5);Enqueue(&q,6);
  Enqueue(&q,7);Enqueue(&q,8);

  // 맨위 데이터
  printf("가장 앞쪽 데이터 확인 %d \n",QPeek(&q));

  // 데이터 출력
  while(!QIsEmpty(&q))
    printf("%d ",Dequeue(&q));
  
  return 0;
}
```
