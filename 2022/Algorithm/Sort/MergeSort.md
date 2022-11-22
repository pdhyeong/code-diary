## 병합정렬


### 개념



### 이해CODE

```C++

#include <iostream>
#include <algorithm>

using namespace std;
int cnt;
// 서열정리
void merge(int a[],int low,int mid ,int high){
  int b[1000];
  int i = low;
  int j = mid + 1;
  int k = 0;
  cout << "merge--------------------------------------" << endl;
  cout << " left = " << low << " mid = " << mid+1 << " right = " << high <<'\n';
  while(i <= mid && j <= high){
    if(a[i] <= a[j]){
      b[k] = a[i];
      k++;
      i++;
    }
    else {
      b[k] = a[j];
      j++;
      k++;
    }
  }
  while(i <= mid){
    b[k] = a[i];
    i++;
    k++;
  }
  while(j <= high){
    b[k] = a[j];
    j++;
    k++;
  }
  k--;
  while(k >= 0){
    a[low + k] = b[k];
    k--;
  }
}

// 대진표작성
void mergesort(int a[],int low,int high){
  cnt += 1;
  if(low < high){
    
    int m = (low + high) /2;
cout << "\nfirst--------------------------------------" << endl;
    cout << " left = " << low << " mid = " << m << " right = " << high <<'\n';

    
    //left
    
    mergesort(a,low,m);
    cout << "second--------------------------------------" << endl;

    
    //right
    cout << " left = " << low << " mid = " << m << " right = " << high <<'\n';

    mergesort(a,m+1,high);

    
cout << "third--------------------------------------" << endl;
    cout << " left = " << low << " mid = " << m << " right = " << high <<'\n';

    
    merge(a,low,m,high);
  }
  else {
    return ;
  }
}
int main() {
  int a[6] = {1,2,5,4,10,6};
  int i;

  for(i = 0;i<6;i++){
    cout << a[i] << " ";
  }
  mergesort(a,0,6-1);
  cout << '\n';
  cout << cnt << endl;
  for(i = 0;i<6;i++){
    cout << a[i] << " ";
  }
  return 0;
}
```

