## 타임스크립트 맛보기

브라우저에서는 타임스크립트를 인식할 수 없기 때문에 javascript로 변환해서 사용한다.

```javascript
function add(num1,num2) {
    console.log(num1 + num2);
}
add(); // NaN
add(1); // NaN
add(1,2); // 3
add(3,4,5); // 7
add("hello","world"); // helloworld
```

위 코드에서는 오류가 나기보다 출력값이 제대로 나오지 않는다. 

즉 컴파일은 된다는 소리이다. 이 오류는 개발자가 직접 해결해야하는데 이는 런타임떄 타입이 결정되기 때문이다.

이것은 자바스크립트가 동적언어 이기 때문인데 정적언어인 C++ 이나 Java만 봐도 타입이 다르면 오류를 발견해준다.

자바스크립트가 개발 자체는 빠를지 몰라도 안정성은 보장할 수 없다는 것. 

타임스크립트도 정적타입의 언어로 코드를 적는 시간은 더 걸리겠지만 더 안정적이게 활용이 가능하다.


----------------------------------------------------------------

### 예시 코드

위에서 사용하는 add를 타입스크립트로 변환하면 다음과 같다. 

```typescript
function add(num1:number,num2:number) {
    console.log(num1 + num2);
}

add(); // error
add(1);// error
add(1,2); // 3
add(3,4,5); // error
add("hello","world"); // error
```

배열의 엘리먼트를 보여주는 Javascript 함수

```JS
function showItem(arr){
    arr.forEach((item)=>{
        console.log(item);
    });
}


showItem([1,2,3]); // 1 ,2 ,3
showItem(1,2,3); // type 에러 
```

TypeScript로 변환하면 다음과 같다.

```TS
function showItem(arr:number[]){
    arr.forEach((item)=>{
        console.log(item);
    });
}


showItem([1,2,3]); 1,2,3
showItem(1,2,3); // error
```
