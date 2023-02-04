In object-oriented design, the dependency inversion principle is a specific methodology for loosely coupling software modules. 

When following this principle, the conventional dependency relationships established from high-level,

policy-setting modules to low-level, dependency modules are reversed, 

thus rendering high-level modules independent of the low-level module implementation details. The principle states:[1]

High-level modules should not import anything from low-level modules. Both should depend on abstractions (e.g., interfaces).

Abstractions should not depend on details. Details (concrete implementations) should depend on abstractions.

By dictating that both high-level and low-level objects must depend on the same abstraction, 

this design principle inverts the way some people may think about object-oriented programming.[2]

The idea behind points A and B of this principle is that when designing the interaction between a high-level module and a low-level one, 

the interaction should be thought of as an abstract interaction between them. 

This not only has implications on the design of the high-level module, 

but also on the low-level one: the low-level one should be designed with the interaction in mind and it may be necessary to change its usage interface.

In many cases, thinking about the interaction in itself as an abstract concept allows the coupling of the components to be reduced without introducing additional coding patterns, allowing only a lighter and less implementation-dependent interaction schema.

When the discovered abstract interaction schema(s) between two modules is/are generic and generalization makes sense, this design principle also leads to the following dependency inversion coding pattern.

출처: wikipedia

모듈을 느슨하게 결합하는 위한 특정 방법론으로 

상위의 모듈보다 하위 모듈에 세부 사항과 독립적으로 상위 수준 모듈을 랜더링하는 방법이다.

말로만 보면 굉장히 어려우니까 코드로 봐보자

```py
class Cat:
  def speak(self):
    print("meow")
    
class Dog:
  def speak(self):
    print("bark")
    
    
class Sheep:
  def speak(self):
    pass

class Cow:
  def speak(self):
    pass
    

class Zoo:
  def _init_(self):
    self.cat = Cat()
    self.dog = Dog()
    self.sheep = Sheep()
    self.cow = Cow()
   
```

어떻게 보면 굉장히 간결하고 직관적인 코드이지만 동물이 추가 될 때마다 여러번 Zoo를 수정해야하는 일이 생긴다.

Zoo 라는 클래스가 -> 다른 모듈들을 가르키는 모양 이다

하지만 Zoo를 Animal을 가르키게만들고 Cat과 Dog같은 동물들도 Animal을 가르키게 한다음 단지 Animal을 추가하는 형식으로 표현할 수 있다.


```py
class Animal:
  def speak(self):
    pass

class Cat(Animal):
  def speak(self):
    print("meow")
    
class Dog(Animal):
  def speak(self):
    print("bark")
    
class Zoo:
  def _init_(self):
    self.animals = []
  
  def addAnimal(self,animal:Animal):
    self.animals.append(animal)
    
  def speakAll(self):
    for animal in self.animals:
      animal.speak()
      
zoo = Zoo()
zoo.addAnimal(Cat())
zoo.addAnimal(Dog())
zoo.speakAll()
```

이렇게 하면 상위모듈에서 하위모듈을 가르키는 형태에서 추상화 클래스를 생성하여 하위 모듈을 상위 모듈쪽을 가르키개 하여 Dependency inversion이라 한다.
