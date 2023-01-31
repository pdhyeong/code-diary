## interface segregation

In the field of software engineering, 

the interface segregation principle (ISP) states that no code should be forced to depend on methods it does not use.

출처 : wikipedia

클라이언트는 사용하지도 않는 메서드에 의존하게 만들어서는 안된다라는 뜻으로 큰 인터페이스는 더 작은단위로 분리하는게 좋다.

먼저 interface에 대해 알아보자

```C++
interface Icar
{
  void drive();
  void turnLeft();
  void turnRight();
}

class Genesis:Icar
{
  void drive(){}
  void turnLeft(){}
  void turnRight(){}
}

class Avante:Icar
{
  void drive(){}
  void turnLeft(){}
  void turnRight(){}
}

Avante nocopeCar = new Avante();
Genesis secondCar = new Genesis();

```

위에 코드는 아반떼와 제네시스가 car의 기능을 상속받아서 사용할 수 있다.

interface segregation 의 원칙을 살펴보면

```C++
interface IcarBoat
{
   void drive();
   void turnLeft();
   void turnRight();
   
   void steer();
   void steerLeft();
   void steerRight();
}

class Genesis: ICarBoat
{
   void drive();
   void turnLeft();
   void turnRight();
}
```

위 처럼 차와 보트의 기능을 한번에 인터페이스안에 같이 넣어버리면 불필요한 function들이 추가로 할당되므로 인터페이스를 분할하는게 낫다.


```C++
interface IcarBoat
{
   void drive();
   void turnLeft();
   void turnRight();
}
interface Iboat
{
   void steer();
   void steerLeft();
   void steerRight();
}

class Genesis: ICar
{
   void drive();
   void turnLeft();
   void turnRight();
}

class CatBoat: Icar, Iboat
{
  void drive();
  void turnLeft();
  void turnRight();
}
```

위 처럼 차라리 분할하여 두개의 기능이 필요하면 둘다 참조해서 할당하면 된다.
