### useState,props

리액트에서 State는 객체에 대한 업데이트를 실행한다. state가 변경되면 변경된 값을 전하여 컴포넌트는 리렌더링 된다.

 

props는 properties의 줄임말로 어떠한 값을 컴포넌트에 전달해줘야할 때, props를 사용한다.

 

state와 props가 비슷해서 다소 이해하기 힘들수 있지만 이 둘은 엄연히 다르다.

 

원래 글로 보면 복잡하니까 코드로 봐보자

 

ex) State

### Hi.js

```JS
import {useState} from "react";

function Hi() {

	let name = 'park';
	const [name,setName] = useState("park");

	function printName() {
    	name = name === "park" ? "park" : "nopark";
        setName(name);
    }
    
    
    return (
    	<div>
        	<h1>이름 적기</h1>
            <h2>{name}</h2>
            <button onClick = {printName}>printName</button>
        </div>
      );
}
```
위의 코드를 실행하면 페이지에서 printName이라는 버튼을 눌럿을때 가장 크게 적혀있는 park이 nopark과 교차하여 이벤트 처리 된다.

 

 

ex) props

 

### App.js

```JS
import Hi from "Hi.js의 파일위치"

function App () {
	return (
    	<div className="App">
        	<h2>props : properties</h2>
            <Hi age = {24} />
        </div>
      );
}    
```       
            
### Hi.js


```JS
import {useState} from "react";

function Hi(age) {

	let name = 'park';
	const [name,setName] = useState("park");
    const adult = age > 20 ? "아 벌써 그렇게됐습니다 ㅎㅎ~" : "동안입니다 ㅎㅎ";

	function printinform() {
    	name = name === "park" ? "park" : "nopark";
        setName(name);
    }
    
    
    return (
    	<div>
        	<h1>이름 적기</h1>
            <h2>{name}{age} {msg} </h2>
            <button onClick = {printName}>printName</button>
        </div>
      );
}
```

props를 사용하여 다른 컴포넌트의 값을 가져와서 현재 컴포넌트에서 사용할 수 있다.

 

간단하게 변수를 설정하여 원하는 값을 다른 컴포넌트에서 가져다 쓰는것이다.

 

아직은 완벽하게 개념이 잡히지 않아서 좀 더 공부해서 포스팅 해야겠다.
