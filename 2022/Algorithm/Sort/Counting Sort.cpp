#include <iostream>
#define MAX_VALUE 10

using namespace std;
int arr[10] = {10,8,4,5,2,3,1,9,7,6};
int cnt[MAX_VALUE+1];

void countingsort(int *cnt,int *arr,int n){
  for(int i = 0;i< n ;i++){
    cnt[arr[i]] += 1;
  }
  for(int i = 0;i <= MAX_VALUE;i++){
    for(int j = 0;j< cnt[i];j++){
      cout << i << ' ';
    }
  }
}
int main() {
  countingsort(cnt,arr,10);
  return 0;
}
