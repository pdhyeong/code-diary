## Thrashing

하나의 프로세스는 실행을 위해서 몇 개의 페이지 프레임을 할당 받는다.

대부분의 경우 각 작업에 필요한 충분한 페이지 프레임을 항상 받을 수 없는데,

프로세스에 할당된 프레임의 수가 효율적인 실행을 위해 시스템에 의해 요구되는 최소한의 수보다 적으면 적을수록 페이지 부재율은 증가하고 그래서 프로세스의 실행이 늦어지게 된다.

프로세스가 어느정도의 프레임을 갖고 있지 않다면. 페이지 부재가 불생하게 되어 프레임안에 있는 사용중인 어떤 페이지를 교체하여야 하는데,

이러한 페이지 부재가 계속적으로 발생하게 되어 프로세스가 수행되는 시간 보다 페이지 교체에 소비하는 시간이 더 많아지는 경우를 **스레싱(thrashing)** 이라고 한다.

다중 프로그래밍의 정도가 한계 이상 높아지면 스래싱이 발생하여 중앙처리장치의 효율이 급격히 감소한다.

------------------------------------------------------

### 구역성(locality)

스래싱을 방지하기 위해 한 프로세스가 효율적인 수행을 위해 제공받아야할 프레임의 수를 알 필요가 있다.

작업세트(working set) 기법은 프로그램 시행의 구역성을 정의한다.

**구역성이란 프로세스가 기억장치 내의 모든 정보를 균이랗게 참조하는 것이 아니라 반복적으로 호출되는 각 명령어들의 집합체로 구성된 국부적인 부분만을 집중적으로 참조한다. 라는 의미이다.**

```
1. 시간 구역성 : 최근에 참조된 기억장소가 가까운 장래에도 계속 참조될 가능성이 높음을 의미한다. 예로 순환 , 서브루틴, 스택,카운팅 등이 있다.

2. 공간 구역성 : 하나의 기억장소가 참조되면 그 근처의 기억장소가 계속 참조되는 경향이 있음을 의미한다. 예로 배열 수행,순차 코드의 실행 등이 있다.
```

------------------------------------------------------

### 작업세트(working set)

구역성 연구의 가장 중요한 연구는 프로세스가 많이 참조하는 페이지들의 주기억장치 내에 있는 한 그 프로그램은 효율적으로 실행된다는 점이다.

작업세트란 프로세스에 의해 자주 참조되는 페이지들의 집합체를 의미한다.

하나의 프로세스가 효율적으로 실행되기 위해서는 그 프로세스의 작업세트가 주기억장치 내에 존재하여야 하며, 그렇지 못할 경우에는 필요한 페이지를 위한 빈번한 교체과정으로 인해

종국에는 스래싱이라고 하는 현상이 발생한다.

그래서 수행중인 프로그램이 주기억장치 안에 작업세트를 유지시키고 있다면 매우 효율적으로 실행될 수 있을 것이다.

새로운 프로세스를 현재의 작업세트에 첨가시키는 결정은 새 프로세스를 위한 작업세트를 수용할 만한 실기억 공간의 여유가 있는가에 달려있고, 

처음 시작되는 프로세스인 경우 시스템이 그 프로세스의 작업세트의 크기를 알 수 없으므로 대충 짐작하여 배정한다.

------------------------------------------------------

### 페이지 부재율

스래싱이란 페이지 부재가 너무 빈번하게 발생하므로 생긴다.

우리가 원하는 것은 페이지 부재를 효율적으로 조절하는 것.

페이지 부재율이 너무 높다면 그 프로세스가 더 많은 프레임을 필요로 한다는 것이고 너무 낮다면 그 프로세스가 너무 많은 프레임을 가지고 있음을 의미한다.

따라서 페이지 부재율의 상한과 하한을 정해 놓고 페이지 부재율이 상한을 넘으면 그 프로세스에게 다른 프레임을 더 할당해 주고, 하한보다 낮으면 그 프로세스로부터 프레임을 회수한다. 

이렇게하면 직접적으로 스래싱을 방지하면서 페이지 부재율을 측정하고 조절할 수 있을 것이다.

이러는 과정중 어느시점에서 페이지 뷰재율이 증가되고 유효 프레임이 없게되면 프로세스 집합 중 어떤 프로세스를 골라서 그 프로세스의 실행을 중지시켜야한다.

그러면 프로세스에게 할당되었던 프레임을 높은 페이지 부재율을 가지는 프로세스들에게 분배시킬 수 있을 것이다.
