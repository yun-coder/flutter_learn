// Dart 类
import 'dart:math';

// todo 隐式接口  implements
//如果需要实现多个类接口，可以使用逗号分隔每个接口类：
// class Point implements Comparable, Location {...}
// todo 工厂构造函数无法访问 this。

// todo 在构造方法中使用 this
class MyColor {
  int red;
  int green;
  int blue;
  // todo 标记为必需的参数仍然可以为空
  MyColor({required this.red, required this.green, required this.blue});
}

// todo 重定向构造方法 重定向方法没有主体，它在冒号（:）之后调用另一个构造方法
class Automobile {
  String make;
  String model;
  int mpg;

  Automobile(this.make, this.model, this.mpg);

  Automobile.hybrid(String make, String model) : this(make, model, 60);

  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}

// todo Const 构造方法
class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;

  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}

// todo Initializer lists
class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  // todo 断言 捕获不少于2个字符的单词
  FirstTwoLetters(String word)
      : assert(word.length >= 2),
        letterOne = word[0],
        letterTwo = word[1];
}

// todo  命名构造方法
class StartPlay {
  double x, y;

  StartPlay(this.x, this.y);

  StartPlay.test()
      : x = 0,
        y = 0;
}

class Person {
  String? firstname;

  Person.fromJson(Map data) {
    // print("in Person");
  }
}

class Employee extends Person {
  // todo 调用父类构造函数的参数无法访问 this 。 例如，参数可以为静态函数但是不能是实例函数
  Employee.fromJson(super.data) : super.fromJson() {
    // print("in Employee");
  }
}

class Impostor implements Person {
  // String get _name => '';

  // todo 重写类成员
  @override
  String? firstname;
}

//抽象类
abstract class AbsContainer {
  void updateChildren(); // 抽象方法 只存在于抽象类中
}

class EffectAbs extends AbsContainer {
  // 实例化父类抽象方法相当于重写 @override 必须添加
  @override
  void updateChildren() {
    // print("这是实例化父类抽象方法的地方");
  }

  EffectAbs.printContext() {
    updateChildren();
  }
}

// todo 初始化
class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;

  // 初始赋值
  Point(this.x, this.y) : distanceFromOrigin = sqrt(x * x + y * y);
}

// todo 常量构造函数
// 如果该类生成的对象是固定不变的， 那么就可以把这些对象定义为编译时常量。 为此，需要定义一个 const 构造函数， 并且声明所有实例变量为 final
class ImmutablePoint {
  // static final ImmutablePoint origin = const ImmutablePoint(0, 0);
  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

// todo 重写 noSuchMethod
// 如果不重写 noSuchMethod，访问不存在的实例变量时会导致 NoSuchMethodError 错误。
// 除非符合下面的任意一项条件， 否则没有实现的方法不能够被调用：
// receiver 具有 dynamic 的静态类型 。
// receiver 具有静态类型，用于定义为实现的方法 (可以是抽象的), 并且 receiver 的动态类型具有 noSuchMethod() 的实现， 该实现与 Object 类中的实现不同。
class AllMethods {
  @override
  void noSuchMethod(Invocation invocation) {
    // print('You tried to use a non-existent member: ${invocation.memberName}');
  }
}

// todo enum 枚举类型
// todo 枚举类型也称为 enumerations 或 enums ， 是一种特殊的类，用于表示数量固定的常量值。
// 枚举类型具有以下限制：
// todo 枚举不能被子类化，混合或实现。
// todo 枚举不能被显式实例化。
enum Color { red, green, blue }

// todo 为类添加功能： Mixin 是复用类代码的一种途径， 复用的类可以在不同层级，之间可以不存在继承关系  必须显示声明 Mixin 类
mixin Music {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      // print('Playing piano');
    } else if (canConduct) {
      // print('Waving hands');
    } else {
      // print('Humming to self');
    }
  }
}

// todo 对于常见或广泛使用的工具和函数， 应该考虑使用顶级函数而不是静态方法。
class TestFunc extends AllMethods with Music {
  // 静态变量只到它们被使用的时候才会初始化。
  static const initialParam = 20;
}

// todo 可调用类  通过实现类的 call() 方法， 能够让类像函数一样被调用
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

void main() {
  // var employee = Employee.fromJson({'a': 'a-1', 'b': 'b-1', 'c': 'c-1'});
  // print(employee); // Instance of 'Employee' 实例方法

  EffectAbs.printContext();

  // 枚举中的每个值都有一个 index getter 方法， 该方法返回值所在枚举类型定义中的位置（从 0 开始）。 例如，第一个枚举值的索引是 0 ， 第二个枚举值的索引是 1
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);
  // 使用枚举的 values 常量， 获取所有枚举值列表
  // List<Color> colors = Color.values;
  // print(colors[2]);

  // print("TestFunc.initialParam: ${TestFunc.initialParam == 20}");

  // var wf = WannabeFunction();
  // var out = wf("Hi", "there,", "gang");
  // print('$out'); // Hi there, gang!
}
