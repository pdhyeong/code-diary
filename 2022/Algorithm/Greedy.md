# Algorithm 뿌셔


## 알고리즘 이론


### 그리디 알고리즘
Greedy 라는 말 그대로 탐욕스러운, 욕심 많은 이라는 뜻으로 '현재 상황에서 지금 당장 좋은 것만 고르는 방법'을 의미한다.

탐욕 알고리즘 문제를 해결방법

1. 선택 절차(Selcetion Procdure): 현재 상태에서의 최적의 해답을 선택

2. 적절성 검사(Feasivility Check) : 선택된 해가 문제의 조건을 만족하는지 검사한다.

3. 해답 검사(Solution Check) 원래 문제가 해결되었는지 검사하고, 해결되지 않았다면 선택절차로 돌아가 위의 과정을 반복

그리드 갈고리즘은 100# 최적해를 보장해주지 않는다. 어능정도 적합한 수준의 해답을 알려준다. 근사 알고리즘으로 사용한다.

그리디 알고리즘 예시에는

    1. 거스름돈 문제
    2. 제약조건이 많은 대부분의 문제
    3. 다익스트라 알고리즘
    4. 허프만 코드
    5. 크러스컬 알고리즘
    6. 최소 신장 트리 등이 있다.
참고 자료 : https://hanamon.kr/%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-%ED%83%90%EC%9A%95%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-greedy-algorithm/,

https://namu.wiki/w/%EA%B7%B8%EB%A6%AC%EB%94%94%20%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98


## 실제 적용 문제 예시

![ex_screenshot](./img/Coin.png)

C언어 코드
```C
#include <stdio.h>

int main(int argc, const char * argv[]) {
    int arr[100],num1,num2,j,i;
    int count = 0,coin = 0;
    scanf("%d %d",&num1,&num2);
    for(i = 0;i<num1;i++)
    {
        scanf("%d",&arr[i]); // 동전들 입력
    }
    for(j = i-1 ;j>=0;j--)
    {
        count = 0;
        if(num2 < arr[j])
            continue; // num2가 나눌수있는 수가 나올수있을때 까지 동전단위 찾기
        else {
            count += (num2/arr[j]); // 맞는 동전을 찾으면 나눈후 count에 더하기
            num2 = num2 - (count*arr[j]); //잔액 구하기
            coin += count; // 동전 갯수만큼 coin 변수에 더해주기
        }
    }
    printf("%d\n",coin);
    return 0;
}
```

파이썬 코드

```py
change = []
count = 0
n , coin = map(int,input().split())
for i in range(n):
    change.append(input()) # 화폐단위 리스트에 추가
change = list(map(int, change)) # 리스트 정수형으로 바꿔주기
change.sort(reverse=True) # 내림차순으로 바꿔서 큰 것 부터 비교하기
for i in change:
    count += coin // i # 동전 갯수를 추가
    coin %= i # 남은돈 갱신
print(count)
```

