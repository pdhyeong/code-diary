## Open-Closed Principle

In object-oriented programming,

the open–closed principle (OCP) states "software entities (classes, modules, functions, etc.) should be open for extension,but closed for modification";

[1] that is, such an entity can allow its behaviour to be extended without modifying its source code.

The name open–closed principle has been used in two ways. Both ways use generalizations (for instance, inheritance or delegate functions) to resolve the apparent dilemma,

but the goals, techniques, and results are different.

Open–closed principle is one of the five SOLID principles of object-oriented design.

출처: 나무위키

영어로 써져있어서 긴글을 보면 머리가 아프지만, 간단하게 해석하면 Open-closed 원칙은 확장에 열려있어야하고, 수정에서는 닫혀있어야한다는 프로그래밍 원칙이다.

이게 뭔 소리인가 싶겠지만 , 소프트웨어 개발 작업에 이용된 많은 모듈 중에 하나에 수정을 가할 때 그 모듈을 이용하는 다른 모듈을 줄줄이 고쳐야 한다면, 그런 프로그램은 수정하기가 어렵다.

개방-폐쇄 원칙은 시스템의 구조를 올바르게 재조직(리팩토링)하여 나중에 이와 같은 유형의 변경이 더 이상의 수정을 유발하지 않도록 하는 것이다.

개방-폐쇄 원칙이 잘 적용되면, 기능을 추가하거나 변경해야 할 때 이미 제대로 동작하고 있던 원래 코드를 변경하지 않아도, 기존의 코드에 새로운 코드를 추가함으로써 기능의 추가나 변경이 가능하다.

간단하게 아래에 코드를 봐보자

```py
class Animal:
  def _init_(self,a_type):
    self.a_type = a_type
    
def hey(animal:Animal):
  if animal.a_type == 'Cat':
    print('meow')
  elif animal.a_type == 'Dog':
    print('bark')
  else:
    raise Error('wrong a_type')
  
  
kitty = Animal('Cat')
bingo = Animal('Dog')

hey(kitty) # meow
hey(bingo) # bark
```

위 코드에 Cow 와 Sheep을 추가하려고 한다.

```py
class Animal:
  def _init_(self,a_type):
    self.a_type = a_type
    
def hey(animal:Animal):
  if animal.a_type == 'Cat':
    print('meow')
  elif animal.a_type == 'Dog':
    print('bark')
  else:
    raise Error('wrong a_type')
  
  
kitty = Animal('Cat')
bingo = Animal('Dog')
cow = Animal('Cow')
sheep = Animal('Sheep')

hey(kitty) # meow
hey(bingo) # bark
hey(cow) # error
hey(sheep) # error
```

위 코드에서 cow와 sheep 은 오류가 난다. 

hey함수안에서의 조건이 없기 때문이다.

하지만 Open-closed 원칙은 확장에서는 열려있고 수정에서는 닫혀있다고 했다.

여기서는 cow와 sheep에 대한 확장이 닫혀 있으므로 위에 hey 함수는 Open-closed 원칙에 위반인 것이다.

hey 함수의 Open-closed 원칙을 지키려면 다음과 같이 수정해야한다.

```py
class Animal:
  def speak(self):
    pass
class Cat(Animal):
  def speak(self):
    print('meow')

class Dog(Animal):
  def speak(self):
    print('bark')

def hey(animal:Animal):
  animal.speak()
  
kitty = Cat()
bingo = Dog()

hey(kitty) # meow
hey(bingo) # bark
```

위와 같이 수정할 수 있다.

여기에서 전 처럼 cow와 sheep을 추가하려고 하면 아래와 같이 하면 된다.


```py
class Animal:
  def speak(self):
    pass
class Cat(Animal):
  def speak(self):
    print('meow')

class Dog(Animal):
  def speak(self):
    print('bark')

class Cow(Animal):
  def speak(self):
    print('moo')

class Sheep(Animal):
  def speak(self):
    print('meh')

def hey(animal:Animal):
  animal.speak()
  
kitty = Cat()
bingo = Dog()
cow = Cow()
sheep = Sheep()

hey(kitty) # meow
hey(bingo) # bark
hey(cow) # moo
hey(sheep) # meh
```

이처럼 수정하면 hey 함수는 수정하지 않고 추가되는 동물둘은 class만 추가해주면 된다.

이렇게 hey 함수에 대해 extension에 관해서는 열려있고 수정에 대해서 닫혀 있는 원칙을 적용해 보았다.
