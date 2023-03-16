### 합성명제(coumpound proposition)

합성명제 Compound Proposition 이란

하나 이상의 명제들이 논리연산자에 의해 결합된 명제

------------------------

### 조건명제(Comditional Proposition)

p -> q 라 표현하기도 한다.

문장 p,q가 명제 일때, 명제 p가 가정 또는 전제이고, 명제 q가 결론 또는 결과가 되는 명제

가정이 되는 명제 p가 참이고, 결론이 되는 명제 q가 거짓이 되는 경우에만 거짓이다.

------------------------

### 쌍방조건명제(Biconditional Proposition)

문장 p,q가 명제일때, 명제 p와 q가 가정이면서 동시에 결론인 명제 p <-> q로 표현한다.

p,q의 진리 값이 같을 때는 참이고 아니면 거짓이다.

(p->q) and (q->p)

------------------------

**위의 조건들을 간단하게 예제문제로 표현하면**

#### (p->!q)<->(!p<->q) 를 나타내면

간단하게 코드로 봐보자

#### CODE

```C++
#include <iostream>
#define TRUE  1
#define FALSE  0

using namespace std;

// 조건명제
bool condition(bool p,bool q){
  if(p == TRUE && q == TRUE){
    return TRUE;
  }
  else if(p == TRUE && q == FALSE){
    return FALSE;
  }
  else if(p == FALSE && q == TRUE){
    return TRUE;
  }
  else {
    return TRUE;
  }
}

// 쌍방조건명제
bool bicondition(bool p,bool q){
  return condition(p,q) && condition(q,p);
}
int main() {
  
  if((!TRUE&&TRUE) || (TRUE&&!TRUE)) {
    printf("배터적 논리합 T T 일때");
  }
  if((!TRUE&&FALSE) || (TRUE&& !FALSE)) {
    printf("배타적 논리합 T F 일때 \n");
  }
  if((!FALSE && TRUE)||(FALSE && !TRUE)){
    printf("배타적 논리합 F T 일때\n");
  }
  
  
  bool p = TRUE;
  bool q = TRUE;
  // 예제
  printf("p q가 TRUE일때\n");
  if(bicondition(condition(p,!q),bicondition(!p,q))){
    printf("결과는 TRUE\n");
  }
  else {
    printf("결과는 FALSE\n");
  }

  p = TRUE;
  q = FALSE;
  
  printf("p가 TRUE q가 FALSE 일때");
  printf("\n");
  if(bicondition(condition(p,!q),bicondition(!p,q))){
    printf("결과는 TRUE\n");
  }
  else {
    printf("결과는 FALSE\n");
  }

  p = FALSE;
  q = FALSE;
  
  printf("p가 FALSE q가 FALSE 일때");
  printf("\n");
  if(bicondition(condition(p,!q),bicondition(!p,q))){
    printf("결과는 TRUE\n");
  }
  else {
    printf("결과는 FALSE\n");
  }
  return 0;
}
```
