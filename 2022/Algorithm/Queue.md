### 문제

정수를 저장하는 큐를 구현한 다음, 입력으로 주어지는 명령을 처리하는 프로그램을 작성하시오.


명령은 총 여섯 가지이다.

```
push X: 정수 X를 큐에 넣는 연산이다.
pop: 큐에서 가장 앞에 있는 정수를 빼고, 그 수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
size: 큐에 들어있는 정수의 개수를 출력한다.
empty: 큐가 비어있으면 1, 아니면 0을 출력한다.
front: 큐의 가장 앞에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
back: 큐의 가장 뒤에 있는 정수를 출력한다. 만약 큐에 들어있는 정수가 없는 경우에는 -1을 출력한다.
```
---------------------------------

### 입력

첫째 줄에 주어지는 명령의 수 N (1 ≤ N ≤ 2,000,000)이 주어진다.

둘째 줄부터 N개의 줄에는 명령이 하나씩 주어진다. 주어지는 정수는 1보다 크거나 같고, 100,000보다 작거나 같다. 

문제에 나와있지 않은 명령이 주어지는 경우는 없다.

---------------------------------

### 출력

출력해야하는 명령이 주어질 때마다, 한 줄에 하나씩 출력한다.

### 예제 입력 1 
```
15
push 1
push 2
front
back
size
empty
pop
pop
pop
size
empty
pop
push 3
empty
front
```

### 예제 출력 1 
```
1
2
2
0
1
2
-1
0
1
-1
0
3
```

---------------------------------

### CODE

```C++
#include <iostream>
#include <string>
#include <queue>

using namespace std;

int main() {
  cin.tie(0);
  cin.sync_with_stdio(0);
  int n;
  cin >> n;
  queue<int> qu;
  for(int i =0;i<n;i++){
    string s;
    cin >> s;
    if(s == "push"){
      int k;
      cin >> k;
      qu.push(k);
    }
    else if(s == "pop"){
      int u = qu.front();
      if(qu.empty()){
        cout << -1 << '\n';
      }
      else {
        cout << u << '\n';
        qu.pop();
      }
    }
    else if(s == "front"){
      if(qu.empty()){
        cout << -1 << '\n';
      }
      else {
        cout << qu.front() << '\n';
      }
    }
    else if(s == "empty"){
      if(qu.empty()){
        cout << 1 << '\n';
      }
      else {
        cout << 0 << '\n';
      }
    }
    else if(s == "back"){
      if(qu.empty()){
        cout << -1 << '\n';
      }
      else {
        cout << qu.back() << '\n';
      }
    }
    else if(s == "size"){
      cout << qu.size() << '\n';
    }
  }
  return 0;
}
```

간단하게 STL을 사용하면 풀 수 있었던 문제지만 따로 구현해보고 싶어서 풀었는데 오답처리가 됐다.

```C++
#include <iostream>
#include <string>

using namespace std;

int main() {
  cin.tie(0);
  cin.sync_with_stdio(0);
  int n;
  cin >> n;
  int arr[10000001] = {0,};
  int fr = 0;
  int rear = -1;
  for(int i =0;i<n;i++){
    string s;
    cin >> s;
    if(s == "push"){
      int k;
      cin >> k;
      rear += 1;
      arr[rear] = k;
    }
    else if(s == "pop"){
      if(fr > rear){
        cout << -1 <<endl;
      }
      else {
        int check = arr[fr];
        fr += 1;
        cout << check << endl;
      }
    }
    else if(s == "size"){
      cout << rear - fr + 1 << endl;
    }
    else if(s == "empty"){
      if(fr > rear) {
        cout << 1 << endl;
      }
      else {
        cout << 0 << endl;
      }
    }
    else if(s == "front"){
      if(fr > rear) {
        cout << 1 << endl;
      }
      else {
        cout << arr[fr] << endl;
      }
    }
    else if(s == "back"){
      if(fr > rear) {
        cout << 1 << endl;
      }
      else {
        cout << arr[rear] << endl;
      }
    }
  }
  return 0;
}
```

큐의 동작 방식을 그림으로 그린 다음 표현한건데 시간초과가 나온다 ㅎ.....

rear와 front를 같은 숫자로 할당해도 될 것 같긴한데 일단 그게 문제는 아닌것 같다.

단순히 연산만하게 하는것보다 iterator를 사용하는 내장 함수가 더 빠르다는 것이 좀 놀랍긴하다.


cin.tie(0);,  cin.sync_with_stdio(0); 이라는 입력 시간을 줄여주는 부분을 쓰지 않으면 시간 초과가 난다는 것도 배웠다.
