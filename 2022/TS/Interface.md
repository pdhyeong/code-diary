## TS Iterface practice

```TS
interface User {
  name : string;
  age: number;
}

let user = User = {
  name : 'xx',
  age : 30
}
user.gender = 'male' // 추가가 안됨



// 만약 추가하려면
interface User {
  name : string,
  age: number,
  gender? : string,
  readonly birthYear : number,
}

let user : User = {
  name : 'xx',
  age : 30,
  birthYear : 2000,
}
user.age = 10 ;
user.gender = 'male';
user.birthYear = 1990; // 변경 안된다 readonly 이기 때문



type Score = 'A' | 'B' | 'C' | 'F'; 

interface User {
  name : string,
  age: number,
  gender? : string,
  readonly birthYear : number,
  [grade:number] : Score;
}

let user = User = {
  name : 'xx',
  age: 30,
  birthYear : 2000,
  1 : 'A', // Score 내 리터럴 값이 아니면 에러를 반환
  2 : 'B' // Score 내 리터럴 값이 아니면 에러를 반환
}


// 인터페이스 함수 정의
interface Add {
  (num1:number, num2:number): number;
}

const add : Add = function(x,y) {
  return x + y;
}

add(16,20) // 36



// 화살표 함수 
interface IsAdult {
  (age: number) : boolean; 
}

const a : IsAdult = (age) => {
  return age > 19;
}

a(33) // true;



// Class 정의
interface Car {
  color : string,
  wheels: number;
  start() :void;
}

class Bmw implements Car {
// Car의 속성값을 모두 입력 받아야함 
// 생성자로 사용해도 됨
  color;
  wheels = 4;
  
  constructor(c: string) {
    this.color = c;
   }
   
   start() {
    console.log('Let go');
   }
}

const b = new Bmw('green') 
console.log(b) // Bmw : {"wheel" : 4 , "color" : "green"}
b.start() // 'Let go'


// interface 확장
interface Benz extends Car {
  door : number;
  stop() : void;
}


const benz : Benz = {
  door : 5,
  stop() {
    console.log('stop');
  }
  color = 'red',
  wheel = 4,
  start() {
    console.log('Let go');
  }
}




//interface 는 동시확장 가능
interface Car {
  color : string,
  wheels: number;
  start(): void;
}

interface Toy {
  name : string
}

interface ToyCar extends Car, Toy {
  price : number;
}


const toybenz : ToyCar = {
  color = 'red',
  wheel = 4,
  start() {
    console.log('Let go');
  }
  name : "benz s class",
  price : 300000
}

```
