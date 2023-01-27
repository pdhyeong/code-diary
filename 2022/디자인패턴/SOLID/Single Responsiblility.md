## Single Responsibility

이 간단한 디자인 패턴은 나무위키에 아래와 같이 정의되어있다.

The single-responsibility principle (SRP) is a computer programming principle that states that "A module should be responsible to one, and only one, actor.

"[1] The term actor refers to a group (consisting of one or more stakeholders or users) that requires a change in the module.

Robert C. Martin, the originator of the term, expresses the principle as, "A class should have only one reason to change".

[2] Because of confusion around the word "reason" he has also clarified saying that the "principle is about people."

[3] In some of his talks, he also argues that the principle is, in particular, about roles or actors. For example, while they might be the same person, the role of an accountant is different from a database administrator.

Hence, each module should be responsible for each role.

출처 : 나무위키

아래에 인물들의 말은 생략하고 정의만 보자면 

SRP = 단일 책임 원칙은 "모듈은 단 하명의 actor에게만 책임 져야 한다"라는 프로그래밍 원칙이다. actor라는 단어는 모듈의 변경이 필요한 그룹을 나타낸다.


간단하게 Cat 함수를 예로 들면 

```py
class Cat:
  def _init(self,age,name):
    self.age = age
    self.name = name
    
  def eat(self,food) :
    pass
    
  def walk(self):
    pass

  def speak(self):
    pass

  def print(self) :
    print(f"age:{self.age} name:{self.name}")
    
  def log(self,logger):
    logger.log(f"age:{self.age} name:{self.name}")
    logger.log(datetime.now())
```




위와 같이 코드가 있다면 고양이는 먹고 , 걷고, 말할수 있지만 print와 log는 고양이라는 객체의 기능으로 볼수 없다. 즉 SRP와 맞지 않는것이다.

고양이의 기능의 맞춰 출력하려면

아래 코드와 같다.

```py
class Cat:
  def _init(self,age,name):
    self.age = age
    self.name = name
    
  def eat(self,food) :
    pass
    
  def walk(self):
    pass

  def speak(self):
    pass
    
  def repr(self) :
    return f"age{self.age} name: {self.name}"

kitty = Cat()
print(kitty.repr())
logger.log(kitty.repr())
```

repr이라는 고양이의 상태를 변경할 수 알 수 있는 하나의 함수를 만들어

인스턴스화 해서 출력하는것이다. 위와 같이 하면 SRP의 정의에 부합하게 된다.
