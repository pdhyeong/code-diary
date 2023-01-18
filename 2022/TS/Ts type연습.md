### TS TYPE Practice

```TS
// Array
let age:number = 30;
let isAdult:boolean = true;
let a:number[] = [1,2,3];
let a2:Array<number> = [1,2,3];

let week1:string[] = ['mon','tue','wed'];
let week2:Array<string> = ['mon','tue','wed'];



// Tuple

let b:[string,number];

b = ['z',1];
// 불가능 b = [1,'z'];

b[0].toLowerCase();
b[1].toLowerCase(); // 오류 number 타입이므로 타입 에러가 뜬다.



// enum

enum Os{
  Window, // 0 값을 안주면 인덱스 번호마냥 자동할당
  IOS, // 1
  Android // 2
}


enum Os{
  Window = 3,
  IOS - 10, 
  Android // 11이 자동으로 들어간다.
}

console.log(Os['IOS'])  // 10;
console.log(Os[10]) // IOS

// 값이 정수일 때는 위와 같이 자동매핑 된다.

enum Os {
  Window = 'win',
  IOS = 'ios',
  Android = 'and'
}

// 위 처럼 문자열일 경우는 단반향 매핑만 된다.

 // 특정값만 나오게 한다.
let myOs : Os.Window; // win


```
