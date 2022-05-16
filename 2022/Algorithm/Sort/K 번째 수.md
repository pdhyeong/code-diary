## 프로그래머스 K번째 수

### 문제 설명

배열 array의 i번째 숫자부터 j번째 숫자까지 자르고 정렬했을 때, k번째에 있는 수를 구하려 합니다.

예를 들어 array가 [1, 5, 2, 6, 3, 7, 4], i = 2, j = 5, k = 3이라면

array의 2번째부터 5번째까지 자르면 [5, 2, 6, 3]입니다.
1에서 나온 배열을 정렬하면 [2, 3, 5, 6]입니다.

2에서 나온 배열의 3번째 숫자는 5입니다.

배열 array, [i, j, k]를 원소로 가진 2차원 배열 commands가 매개변수로 주어질 때, 

commands의 모든 원소에 대해 앞서 설명한 연산을 적용했을 때 나온 결과를 배열에 담아 return 하도록 solution 함수를 작성해주세요.

### 제한사항
array의 길이는 1 이상 100 이하입니다.

array의 각 원소는 1 이상 100 이하입니다.

commands의 길이는 1 이상 50 이하입니다.

commands의 각 원소는 길이가 3입니다.


### 입출력 예

array =[1, 5, 2, 6, 3, 7, 4] 	

commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]] 

return = [5, 6, 3]


### 입출력 예 설명
[1, 5, 2, 6, 3, 7, 4]를 2번째부터 5번째까지 자른 후 정렬합니다. [2, 3, 5, 6]의 세 번째 숫자는 5입니다.
[1, 5, 2, 6, 3, 7, 4]를 4번째부터 4번째까지 자른 후 정렬합니다. [6]의 첫 번째 숫자는 6입니다.
[1, 5, 2, 6, 3, 7, 4]를 1번째부터 7번째까지 자릅니다. [1, 2, 3, 4, 5, 6, 7]의 세 번째 숫자는 3입니다.

### 문제 링크
https://programmers.co.kr/learn/courses/30/lessons/42748

### 내가 한 풀이
```C++
#include <vector>
#include <algorithm>
using namespace std;

vector<int> solution(vector<int> array, vector<vector<int>> commands) {
    vector<int> answer; 
    vector<int> sub;
    for (int i = 0; i < commands.size(); i++)
	{
		vector<int> sub; // 임시 벡터 생성
		int k = commands[i][2] - 1; // K 번째 수 index 기준으로는 0부터 시작이므로 -1
		for (int j = commands[i][0]-1; j < commands[i][1]; j++) {
			sub.push_back(array[j]); // 임시 벡터에 넣어서
		}
		sort(sub.begin(), sub.end()); //정렬하고 
		answer.push_back(sub[k]);// 정렬된 값을 answer벡터에 k번째인 수를 경우의 수 마다 삽입
	}
    return answer; // 결과 출력
}
```

### 후기

솔직히 프로그래머스를 처음풀어보는 입장에서 나의 입력 값으로 하는것이 아니라 그냥 입력값의 변수명만 있어서 생각보다

푸는것이 어렵다..... 처음이라 그런지 적응이 필요할 것 같다. 아직은 함수부분만 만드는것이 어려워

콘솔로 먼저 코딩해보았다.

```C++
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main()
{
	vector<vector<int>> commands = { {2,5,3},{4,4,1},{1,7,3} };
	vector<int> arr = { 1,5,2,6,3,7,5 };
	vector<int> answer;

	for (int i = 0; i < commands.size(); i++)
	{
		vector<int> sub;
		int k = commands[i][2] - 1;
		for (int j = commands[i][0]-1; j < commands[i][1]; j++) {
			sub.push_back(arr[j]);
		}
		sort(sub.begin(), sub.end());
		answer.push_back(sub[k]);
	}
	for (int i = 0; i < answer.size(); i++)
	{
		cout << answer[i] << " "; // 결과 값을 따로 확인 해보기
	}
  return 0;
}
```
