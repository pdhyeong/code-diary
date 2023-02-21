#include<iostream>

using namespace std;
int arr[10] = {3,7,5,8,1,6,9,10,2,4};

// 숫자 바꾸기
void swap(int *a, int *b)
{
  int tmp = *a;
  *a = *b;
  *b = tmp;
}

// 퀵 정렬
void quick(int *arr,int start,int end) {
  if (start >= end) {
    return;
  }
  int pivot = start;
  int left = start + 1;
  int right = end;
  while(left <= right) {
    // 내부 파티션 로직
    while(left <= end && arr[left] <= arr[pivot]) {
      left++;
    }
    while(right > start && arr[right] >= arr[pivot]) {
      right--;
    }
    if(left > right) swap(arr[right],arr[pivot]);
    else swap(arr[right],arr[left]);
  }
  quick(arr,start,right-1);
  quick(arr,right+1,end);
}
