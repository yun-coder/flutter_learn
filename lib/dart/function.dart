// dart 函数 语法和 Typescript es6 差不多
// import 'package:characters/characters.dart';

void foo() {}

class A {
  static void bar() {}

  void baz() {}
}

void main() {
  // todo 函数 Function 将参数放到 [] 中来标记参数是可选的
  String say(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with $device';
    }
    return result;
  }

  say('bob', 'hello'); // bob says hello
  say('bob', 'man', 'let\'s go'); //  bob says man with let's go

  // todo List 和 Map 作为参数
  void doStuff(
      {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {'a': 'a-1', 'b': 'b-1', 'c': 'c-1'}}) {
    // print('list:$list');
    // print('gifts:$gifts');
  }

  doStuff();

  // 高效Dart 在公开的API上面定义返回类型
  // 将函数作为参数传递给另一个函数
  void printElement(int element) {
    // print(element);
  }

  var list = [1, 2, 3];
  list.forEach(printElement); // 1 2 3

  // 将函数赋值给一个变量
  funcTovar(msg) => '${msg.toUpperCase()}';
  funcTovar('hello'); // HELLO

  // 匿名函数
  const list2 = ["apple", "banana", "orange"];
  list2.map((e) {
    return e.toUpperCase();
  }).forEach((element) {
    // print('$element: ${element.length}');
    // APPLE: 5
    // BANANA: 6
    // ORANGE: 6
  });
  // 如果函数体内只有一行返回语句，可以使用胖箭头写法
  // list2
  //     .map((e) => e.toUpperCase())
  //     .forEach((element) => print('$element: ${element.length}'));

  // Runes 与 grapheme clusters
  // runes 公开了字符串的 Unicode 码位 使用 characters 包 来访问或者操作用户感知的字符
  // var hi = "Hi DK";
  // print("the end of string:${hi.substring(hi.length - 1)}"); // K
  // print("the last character:${hi.characters.last}"); // K

  // var nullArr = ['null', 'undefined', ''];
  // bool isNull(int sub) {
  //   return nullArr[sub] != null;
  // }

  // print(isNull(2)); //true

  // 测试函数是否相等
  // Function x;
  // x = foo;
  // 比较顶层的函数
  // print('比较顶层的函数:${x == foo}');

  // 比较静态方法
  // x = A.bar;
  // print('比较静态方法${x == A.bar}');

  // 比较实例方法 instance
  // var v = A();
  // var w = A();
  // var y = w;
  // x = w.baz;
  // 引用同一个实例所以是相等的
  // print('y.baz==x:${y.baz == x}');
  // 引用不同的实例
  // print('v.baz != w.baz:${v.baz != w.baz}');
}
