// 运算符
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  // bool _done = false;

  void allDone() {
    // _done = true;
  }
}

void main() {
  // ()	使用方法	代表调用一个方法
  // []	访问 List	访问 List 中特定位置的元素
  // ?[]	判空访问 List	左侧调用者不为空时，访问 List 中特定位置的元素
  // .	访问成员	成员访问符
  // ?.	条件访问成员	与上述成员访问符类似，但是左边的操作对象不能为 null，例如 foo?.bar，如果 foo 为 null 则返回 null ，否则返回 bar
  // !	空断言操作符	将表达式的类型转换为其基础类型，如果转换失败会抛出运行时异常。例如 foo!.bar，如果 foo 为 null，则抛出运行时异常

  //  todo 算术运算符
  // + 加
  // - 减
  // -(负号)
  // * 乘
  // / 除
  // ~/ (除并取整)
  // % 取模
  assert(2 + 3 == 5);
  assert(2 - 3 == -1);
  assert(2 * 3 == 6);
  assert(5 / 2 == 2.5); // 结果为 double
  assert(5 ~/ 2 == 2); // 取商的整数位
  assert(5 % 2 == 1); // 取余数

  int a;
  int b;

  a = 0;
  b = ++a;
  assert(a == b); // 1 == 1

  a = 0;
  b = a++;
  assert(a != b); // 1 != 0

  a = 0;
  b = --a;
  assert(a == b); // -1 == -1

  a = 0;
  b = a--;
  assert(a != b); // -1 != 0

  // 如果b为空时，将变量赋值给b，否则，b的值保持不变。
  // print(b ??= int.parse('123'));

  // 关系运算符   todo identical() 完全相同的
  // var o = Object();
  // var isIdentical = identical(o, Object()); // false, different objects.
  // isIdentical = identical(o, o);
  // !=
  // >
  // <
  // >=
  // <=

  // 类型判断运算符  as is is!
  // as 类型转换  如果类型转换错误会抛出异常
  // is 如果对象是指定类型则返回true
  // is! 如果对象是指定类型就返回false

  // 赋值运算符
  // =  *=  %=  >>>=  ^=  +=  /=  <<=   &=  |=  -=  ~/=   >>=

  // 逻辑运算符
  // !  ||  &&
  // 按位和移位运算符 Dart中二进制运算符可以操作二进制的某一位，但仅适用于整数
  // & 按位与
  // | 按位或
  // ^ 按位异或
  // ~ 表达式   按位取反
  // <<   位左移
  // >>   位右移
  // >>>  无符号右移

  // 条件表达式
  // 如果赋值是根据布尔值 考虑使用 ?:
  // 如果赋值是基于判定是否为 null 考虑使用 ??
  //  condition ？ expression1: expression2 问号表达式   根据布尔表达式确定赋值时，请考虑使用 ? 和 :
  //  expression1 ?? expression2  左侧的为null就执行右边的  如果赋值是根据判定是否为 null 则考虑使用 ??

  // todo 级联运算符 ..  可以在同一个对象上面连续调用对象的多个变量和方法 严格来说 .. 级联操作并非一个运算符而是 Dart 的特殊语法。
  var button = querySelector('#confirm')
    ?..text = 'Confirm'
    ..classes.add('important')
    ..onClick.listen((e) => window.alert('Confirmed!'))
    ..scrollIntoView();
  // 上面的代码相当于
  // var button2 = querySelector('#confirm');
  button?.text = 'Confirm';
  button?.classes.add('important');
  button?.onClick.listen((e) => window.alert('Confirmed!'));
  button?.scrollIntoView();

  // BigObject fillBigObject(BigObject obj) {
  //   return obj
  //     ..anInt = 1
  //     ..aString = 'String!'
  //     ..aList.add(3)
  //     ..allDone();
  // }

  // todo 胖箭头 =>
  // 列表，用逗号分隔（例如“a、b、c”）
  // String joinWithCommas(List<String> strings) => strings.join(',');
}
