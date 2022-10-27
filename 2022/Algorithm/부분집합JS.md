### 문제
두 개의 배열(base, sample)을 입력받아 sample이 base의 부분집합인지 여부를 리턴해야 합니다.

-----------------------------------

### 입력

인자 1 : base
number 타입을 요소로 갖는 임의의 배열

base.length는 100 이하

인자 2 : sample

number 타입을 요소로 갖는 임의의 배열

sample.length는 100 이하

### 출력
boolean 타입을 리턴해야 합니다.

-------------------------------

#### 주의사항
base, sample 내에 중복되는 요소는 없다고 가정합니다.

### 입출력 예시

```JS
let base = [1, 2, 3, 4, 5];
let sample = [1, 3];
let output = isSubsetOf(base, sample);
console.log(output); // --> true

sample = [6, 7];
output = isSubsetOf(base, sample);
console.log(output); // --> false

base = [10, 99, 123, 7];
sample = [11, 100, 99, 123];
output = isSubsetOf(base, sample);
console.log(output); // --> false
```

------------------------

### Advanced

시간 복잡도를 개선하여, Advanced 테스트 케이스(base, sample의 길이가 70,000 이상)를 통과해 보세요.

### CODE
```JS
const isSubsetOf = function (base, sample) {
  // TODO: 여기에 코드를 작성합니다.
  let result = false;
  base.sort((a, b) => a-b);
  sample.sort((a,b)=> a-b);
  
  for(let i = 0;i<base.length;i++){
    if(base[i] === sample[0]) {
      sample.shift();
    }
  }
  if(sample.length===0){
    result = true;
  }
  return result;
};
```

2중포문을 사용하면 시간초과가 뜨기때문에 for문 한개로 겹치면 sample을 삭제하는 식으로 하였다.
