### JSX

 

먼저 위에서 말한 JSX가 무엇인지 알아야 할 필요가 있는데

JSX는 자바스크립트 XML의 줄임말이고 HTML도 아니고 문자열로 취급하지도 않는다.

간단하게 자바스크립트의 확장 문법이라고 생각하면 된다.

 

JSX는 확장 문법이지만 "Babel" 이라는 자바스크립트 컴파일러를 이용하여 화면에 렌더링 해준다.

엄청 복잡할 것 같지만 React에서는 JSX문법만을 가지고 웹 어플리케이션을 개발할 수 있다.

 

 

### JSX 유의사항

 

- 엘리먼트를 여러개 작성하려고 하면 가장 위에서 오프닝 태그와 클로징 태그를 사용해서 감싸줘야된다.

 
```HTML
<div>
  <h1>하윙</h1>
</div>
<div>
  <h2>오랜만</h2>
</div>
```
HTML 문법에서는 문제 없지만 JSX에서는 다음과 같이 사용해야 한다.

 
```HTML
<div>
  <div>
    <h1>하윙</h1>
  </div>
  <div>
    <h2>오랜만</h2>
  </div>
</div>
 
```
- class속성을 사용하려면 "className"으로 표기해야한다.

 

X
```HTML
<div class = "hi"> hi </div>
```
O
```HTML
<div className = "hi"> hi </div>
```

 

- Javascript를 사용하려면 무조건 중괄호를 사용한다.
```JS
function App() {
	const shape = "Triangle";
    
    return (
    	<div>
          My shape is {shape}
        </div>
    );
}
 
```
추가로 React 엘리먼트를 JSX로 작성한다면 대문자로 시작해야한다. ex) return <hello />  -->  <Hello />

소문자로 시작하면 HTML로 엘리먼트로 인식한다고 한다. ㅎ

 

 

- 조건부는 삼항연산자를 사용한다.
```HTML
<div>
  {
    (15 % 2 === 0) ? (<p>15가 2의 약수</p>) : (<p>15는 2의 약수x</p>)
  }
</div>
```
