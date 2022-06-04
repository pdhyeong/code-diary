### 백준 15649
### 백트래킹이란

백트래킹(backtracking)이란? : 해를 찾는 도중 해가 아니어서 막히면, 되돌아가서 다시 해를 찾아가는 기법을 말합니다.

최적화 문제와 결정 문제를 푸는 방법이 됩니다.

백트래킹은 해를 찾아가는 도중, 지금의 경로가 해가 될 것 같지 않으면 그 경로를 더이상 가지 않고 되돌아갑니다.

즉, 코딩에서는 반복문의 횟수까지 줄일 수 있으므로 효율적입니다.

이를 가지치기라고 하는데, 불필요한 부분을 쳐내고 최대한 올바른 쪽으로 간다는 의미입니다.

일반적으로, 불필요한 경로를 조기에 차단할 수 있게 되어 경우의 수가 줄어들지만, 만약 N!의 경우의 수를 가진 문제에서 최악의 경우에는 여전히 지수함수 시간을 필요로 하므로 처리가 불가능 할 수도 있습니다.

가지치기를 얼마나 잘하느냐에 따라 효율성이 결정되게 됩니다.

### 문제
자연수 N과 M이 주어졌을 때, 아래 조건을 만족하는 길이가 M인 수열을 모두 구하는 프로그램을 작성하시오.

1부터 N까지 자연수 중에서 중복 없이 M개를 고른 수열

### 입력
첫째 줄에 자연수 N과 M이 주어진다. (1 ≤ M ≤ N ≤ 8)


### 출력
한 줄에 하나씩 문제의 조건을 만족하는 수열을 출력한다. 중복되는 수열을 여러 번 출력하면 안되며, 각 수열은 공백으로 구분해서 출력해야 한다.

수열은 사전 순으로 증가하는 순서로 출력해야 한다.


![image](https://user-images.githubusercontent.com/71219602/170830542-3b274d48-084d-4b77-8311-337ef45ca373.png)


### CODE
```C++
#include <iostream>
#define MAX 9
using namespace std;

int n,m;
int arr[MAX] = {0,}; // 나열할 수열
bool visited[MAX] = {0,}; // 수열의 방문확인을 위한 배열

void dfs(int cnt) 
{
    if(cnt == m) // m개를 택했으면
    {
        for(int i = 0; i < m; i++)
            cout << arr[i] << ' '; // 기록해둔 값들 출력
        cout << '\n'; 
        return;
    }
    for(int i = 1; i <= n; i++) // n까지의 수에 대해
    {
        if(!visited[i]) // 방문하지 않았다면 
        {
            visited[i] = true; // 방문처리
            arr[cnt] = i; 
            dfs(cnt+1); // 다음 경우의 수 확인
            visited[i] = false; // dfs(cnt+1)로 경우의 수를 확인했으니 취소 처리
        }
    }
}

int main() {
    cin >> n >> m;
    dfs(0);
}
```


### 후기

전형적인 모든 경로를 탐색하는 백트래킹 방법을 사용하는 것이어서 DFS를 사용하겠다는것만 알았다면 크게 어렵지않게 풀수 있었다.

조합의 개수를 구하는 문제이므로 확인해두면 좋다.

백트래킹 내용 : https://chanhuiseok.github.io/posts/algo-23/