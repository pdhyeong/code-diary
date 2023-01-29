## Liskov Substitution

The Liskov substitution principle (LSP) is a particular definition of a subtyping relation, called strong behavioral subtyping, 

that was initially introduced by Barbara Liskov in a 1987 conference keynote address titled Data abstraction and hierarchy.

It is based on the concept of "substitutability" – a principle in object-oriented programming stating that an object (such as a class) may be replaced by a sub-object (such as a class that extends the first class) without breaking the program. It is a semantic rather than merely syntactic relation,

because it intends to guarantee semantic interoperability of types in a hierarchy, object types in particular.

출처 : wikipedia

알아 듣기 어렵지만 간단하게 보면,

S가 T의 서브 타입 일때 오브젝트 T는 오브젝트S 로 치환 가능하다는 의미이다.

이 말은 고양이를 예로 들면 Cat이라는 class가 존재하고 black cat과 pink car이 있으면 Cat에서의 코드를 서브 오브젝트인 black cat이나 pink cat으로 실행해도

이 코드는 우리가 원하는 것 처럼 돌아가야 한다.

아래와 같이 고양이 우는 코드가 있다고 가정한다.

```py
class Cat:
  def speak(self):
    print("meow")
    
class BlackCat(Cat):
  def speak(self):
    print("black cat")

def speak(cat:Cat):
  cat.speak()
    
cat = Cat()
speak(cat) #meow
```

black cat은 Cat으로 치환해도 문제가 없다.

```py
class Cat:
  def speak(self):
    print("meow")
    
class BlackCat(Cat):
  def speak(self):
    print("black cat")

def speak(cat:Cat):
  cat.speak()

cat = Cat()
speak(cat) # black cat
```

Fish는 말을 할 수 없으므로 예외 처리를 하여 Liskov Substitution principle을 지켜야한다.

```py
class Cat:
  def speak(self):
    print("meow")
    
class BlackCat(Cat):
  def speak(self):
    print("black cat")

def speak(cat:Cat):
  cat.speak()
    
cat = Cat()
speak(cat) #meow

cat = Cat()
speak(cat) # black cat

class Fish(Cat):
  def speak(self):
    raise Exception("Fish cannot speak")

cat = Fish()
speak(cat) # Fish cannot speak
```
