## adapter 패턴

소프트웨어 엔지니어링에서 adapter 패턴은 기존 클래스의 인터페이스를 다른 인터페이스로 사용할 수 있도록 하는 소프트웨어 디자인 패턴이다.

소스 코드를 수정하지 않고 기존 클래스를 다른 클래스와 함께 작동하도록 만드는 데 자주 사용된다.

예를 들어 Cat과 Dog가 Animal 클래스를 상속 받고 Animal 클래스의 walk() 함수를 받았다고 하면

아래와 같다.

```py
class Animal:
  def walk(self):
    pass
    
class Cat(Animal):
  def walk(self):
    print("cat walking")
    
class Dog(Animal):
  def walk(self):
    print("dog walking")
    
def makeWalk(animal: Animal):
  aniimal.walk()
  
kitty = Cat()
bingo = Dog()

makeWalk(kitty)
makeWalk(bingo)

cat walking
dog walking
```


Fish라는 객체도 Animal를 상속 받고 walk() 함수를 실행하면 오류가 나게된다.


```py
class Animal:
  def walk(self):
    pass
    
class Cat(Animal):
  def walk(self):
    print("cat walking")
    
class Dog(Animal):
  def walk(self):
    print("dog walking")
    
class Fish:
  def swim(self):
    print("fish swimming")
    
def makeWalk(animal: Animal):
  aniimal.walk()
 
 nemo = Fish() // Fish 클래스를 받고
 makeWalk(nemo) // walk를 상속 받으면 오류가 난다.
```

여기서 걸을 수 없는 Fish의 adapter를 생성하여 fish 의 swim() 함수를 walk()함수를 사용할 수있게 해준다.


```py
class FishAdapter(Animal):
  def _init_(self,fish:Fish):
    self.fish = fish
    
  def walk(self):
    self.fish.swim()
    
nemo = Fish()
adapted_nemo = FishAdapter(nemo)

makeWalk(adapter_nemo)

# 결과 =  fish swimming
```

