## 논리적 동치

두 개의 합성명제 P와 Q의 진리값이 서로 같은 경우

그냥 간단하게 논리적으로 같은 식인가를 판별하는 것


--------------------------------

### 예제

**!(p||(!p && q))와 !p && !q가 같은가?** 를 기준으로 보면
 

```
step 1 : !(p||(!p && q))을 드모르간 법칙을 이용하여 !p && !(!p && q)으로 치환한다.
step 2 : !p && !(!p && q)을 드모르간 법칙을 이용하여 !p && (!(!p) || !q)로 치환된다.
step 3 : 이중 부정법칙을 이용하여 !p && (p || !q)로 치환된다.
step 4 : 분배 법칙을 이용하여 (!p && p) || (!p && !q)로 치환된다.
step 5 : (!p && p) || (!p && !q)이 부정법칙을 이용해서 F || (!p && !q)로 치환된다.
step 6 : F || (!p && !q)이 항등법칙으로 !p && !q 로 치환된다.
```

위의 논리적 동치법칙들을 이용해서 두 합성 명제가 논리적 동치임을 확인할 수 있다.

이것을 컴퓨터에서 확인해보자

```C++
#include <iostream>
#define TRUE  1
#define FALSE  0
using namespace std;

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
bool bicondition(bool p,bool q){
  return condition(p,q) && condition(q,p);
}
bool identity(bool p) {
  if(p && TRUE == TRUE) return p;
  else if(p && TRUE == FALSE) return p;
  else if(p || FALSE == FALSE) return p;
}
bool domination(bool p) {
  if(p && FALSE == FALSE) return FALSE;
  else if(p || TRUE == TRUE) return TRUE;
}
bool negation(bool p) {
  if(p && !p == FALSE) return FALSE;
  else if(p || !p) return TRUE;
  return p;
}
bool doublenegation(bool p){
  return !(!p);
}
bool idempotent(bool p) {
  return p;
}
int main() {

  // !(p||(!p&&q)) 와 !p && !q가 같은가?
  
  // p와 q가 TRUE TRUE,TRUE FALSE,FALSE TRUE, FALSE FALSE일 경우를 확인해보자
  int count = 0;
  bool p = TRUE;
  bool q = TRUE;
  if(!(p||(!p&&q)) == (!p && !q)) {
    count += 1;
  }
  
  p = TRUE;
  q = FALSE;
  if(!(p||(!p&&q)) == (!p && !q)) {
    count += 1;
  }
  
  p = FALSE;
  q = TRUE;
  if(!(p||(!p&&q)) == (!p && !q)) {
    count += 1;
  }
  
  p = FALSE;
  q = FALSE;
  
  if(!(p||(!p&&q)) == (!p && !q)) {
    count += 1;
  }
  count == 4 ? printf("논리적동치\n") : printf("논리적동치 아님\n");


  // 재검사
  bool arrp[2] = {TRUE,FALSE};
  bool arrq[2] = {TRUE,FALSE};

  int realcount = 0;
  for (int i = 0;i<2;i++){
    for (int j = 0;j<2;j++){
      if(!(arrp[i]||(!arrp[i]&&arrq[j])) == (!arrp[i] && !arrq[j])) {
        realcount += 1;
      }
    }
  }
  // 두 값이 동치임을 확인 했을때
  if (realcount == 4) {
    printf("재검사 = 논리적 동치\n");
  }
  return 0;
}
```
