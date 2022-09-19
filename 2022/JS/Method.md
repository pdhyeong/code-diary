### Method

method는 객체 프로퍼티로 할당 된 함수를 의미한다.

method는 다음과 같이 작성할 수 있다.

```JS
const superman = {
  name : 'park',
  age : 24 ,
  play : function() {
    console.log("soccer")
    }
}
```

위에 play : function()의 부분을 fly()로 줄여서 사용할 수 있다.

#### ex)

```JS
const superman = {
  name : 'park',
  age : 24,
  play() {
console.log("soccer")
  }
}
```

------------------------------------------------------

### this

객체 안에 키에 대한 값을 참조할때 다음과 같이 선언하면 안된다.

```JS
const user = {
  name : 'park',
  hello : function() {
    console.log(`Hello, i'm ${user.name}`);
  }
}
```

이렇게 선언하게 되면 user.hello()를 선언했을때 this.name()가 된다.

```JS
const user = {
  name : 'park',
  hello : function() {
    console.log(`Hello,i'm ${this.name}`);
   }
}
```

위에 코드를 사용했을때 

```JS
let boy = {
  name : 'Kim',
  hello : function() {
    console.log(`Hello,i'm ${this.name}`);
   }
};

let girl = {
  name : 'Lee'.
  hello : function() {
    console.log(`Hello,i'm ${this.name}`);
   }
};

boy.hello(); // Hello,i'm Kim
giril.hello(); //Hello,i'm Lee
```

this는 객체의 이름인 Kim과 Lee를 가져오게 된다.

만약 함수를  화살표 함수로 선언했다면 일반 함수와 달리 this를 가지지 않아서 this는 외부에서 값을 가져오게 된다.

```JS
let boy = {
  name : 'Kim',
  hello : function() {
    console.log(this); // 전역객체
   }
};
```

