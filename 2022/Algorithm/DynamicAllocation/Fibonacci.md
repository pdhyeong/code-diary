### 백준 1003

### 문제
다음 소스는 N번째 피보나치 수를 구하는 C++ 함수이다.
```C++
int fibonacci(int n) {
    if (n == 0) {
        printf("0");
        return 0;
    } else if (n == 1) {
        printf("1");
        return 1;
    } else {
        return fibonacci(n‐1) + fibonacci(n‐2);
    }
}
```
fibonacci(3)을 호출하면 다음과 같은 일이 일어난다.

fibonacci(3)은 fibonacci(2)와 fibonacci(1) (첫 번째 호출)을 호출한다.

fibonacci(2)는 fibonacci(1) (두 번째 호출)과 fibonacci(0)을 호출한다.

두 번째 호출한 fibonacci(1)은 1을 출력하고 1을 리턴한다.

fibonacci(0)은 0을 출력하고, 0을 리턴한다.

fibonacci(2)는 fibonacci(1)과 fibonacci(0)의 결과를 얻고, 1을 리턴한다.

첫 번째 호출한 fibonacci(1)은 1을 출력하고, 1을 리턴한다.

fibonacci(3)은 fibonacci(2)와 fibonacci(1)의 결과를 얻고, 2를 리턴한다.

1은 2번 출력되고, 0은 1번 출력된다.

N이 주어졌을 때, fibonacci(N)을 호출했을 때, 0과 1이 각각 몇 번 출력되는지 구하는 프로그램을 작성하시오.

### 입력

첫째 줄에 테스트 케이스의 개수 T가 주어진다.

각 테스트 케이스는 한 줄로 이루어져 있고, N이 주어진다. N은 40보다 작거나 같은 자연수 또는 0이다.

### 출력

각 테스트 케이스마다 0이 출력되는 횟수와 1이 출력되는 횟수를 공백으로 구분해서 출력한다.

![image](https://user-images.githubusercontent.com/71219602/169277653-654326f4-41ec-4b63-9882-a845dca5dc0d.png)

### 설명
0과 1의 갯수는 fibo(0)일때 0이라고 하면 저 fibo() 라는 함수에 어떠한 숫자를 넣었을때 fibo(0)이 출력되는 것을 의미한다.

즉, fibo(1)과 fibo(0)이 총합적으로 호출 되는 갯수를 공백으로 출력하라는 것인데 이것은 그림을 그려서 보면

![image](https://user-images.githubusercontent.com/71219602/169280860-71437164-aae2-48fc-8e92-3780e7ba57d1.png)

와 같다. 

fibo(6) = 8

fibo(0)의 호출 횟수 5번 즉 fibo(n-1)의 반환값 fibo(5) = 5

fibo(1)의 호출 횟수는 8번 fibo(6)의 반환값과 같다. 

수식으로 보면 피보나치자체의 점화식은 (n-1) + (n-2)이지만 0의 갯수는 fibo(n-1) 의 값으로 확인이 가능하고 1의 갯수는 fibo(n)의 값으로 판단할수 있다.

결국 메모이제이션 기법으로 캐싱하고 그 후에 0과 1의 갯수에 대한 패턴식을 찾아내는 문제인 것 같다.

### CODE
```C++
#include<iostream>
using namespace std;
int dp[41]; // 값 저장할 배열
int fibo(int n)
{
	if (n == 0) { 
		dp[0] = 0; //0 이 되면 배열 첫번째는 0으로 값을 매긴다. 호출수를 줄여주는 역할
		return 0;
	}
	else if (n == 1) { // 배열 두번째에도 1을 넣어준다.
		dp[1] = 1;
		return 1;
	}
	if (dp[n] != 0) // 계산한적 있는 값이면 계산되어 있는 배열 값 반환
	{
		return dp[n]; 
	}
	else
	{
		return dp[n] = fibo(n - 1) + fibo(n - 2); // 계산한적 없으면 점화식에 의해서 피보나치 결과 반환
	}
}
int main()
{
	ios::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
  
	int n;
	cin >> n;
	for (int i = 0; i < n; i++)
	{
		int k;
		cin >> k;
		if (k == 0) // 그냥 간단하게 0이면 1 0
			cout << "1 0" << endl;
		else if (k == 1) //1이면 1 0으로 시작
			cout << "0 1" << endl;
		else {
			fibo(k); // 배열안에 값 넣기
			cout << dp[k - 1] << " " << dp[k] << endl; // 
		}
	}
	return 0;
}
```
### 후기

메모이제이션을 사용해서 다이나믹 프로그래밍 하는 기초 문제를 엊그제 풀고나니까 간단하게 풀었다.

확실히 이론적인 내용을 알고 알고리즘을 보면 이해가 훨씬 쉽게 되는 것 같다.


이미지 자료 : https://yeojin-dev.github.io/blog/fibonacci-number-1/
