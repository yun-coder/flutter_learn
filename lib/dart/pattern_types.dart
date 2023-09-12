// ignore: file_names
// import 'dart:math';

// todo 代数数据类型
sealed class Shape {}

class Square implements Shape {
  final double length;

  Square(this.length);
}

class Circle implements Shape {
  final double radius;

  Circle(this.radius);
}

void main() {
  // 代数数据类型
  // double calculateArea(Shape shape) => switch (shape) {
  //       Square(length: var l) => l * l,
  //       Circle(radius: var r) => pi * r * r
  //     };

  // var json = {
  //   'user': ['Lily', 13]
  // };
  // var {'user': [name, age]} = json;
  // todo 如果没有类型模式验证将会变得很冗余
  // if (json case {'user': [String name, int age]}) {
  //     print('User $name is $age years old.');
  // }

  // todo Logical-or  逻辑或模式
  // var isPrimary = switch (color) {
  //   color.red || color.yellow || color.blue => true,
  //   _ => false
  // };

  // todo Logical-and
  // switch ((1, 2)) {
  //   case (var a, var b) && (var b, var c):
  // }
  // todo Relational <,>,<=,>=,==,!=

  // todo Cast  as  强制转换模式
  // (num, Object) record = (1, 's');
  // var (i as int, s as String) = record;

  // todo Null-check 空检查
  // String? maybeString = 'nullable with base type String';
  // switch (maybeString) {
  //   case var s?:
  //     print("non-nullable String here");
  //     break;
  // }

  // todo Null-assert 空断言
  // List<String?> row = ['user', null];
  // switch (row) {
  //   case ['user', var name!]: // ...
  //   // 'name' is a non-nullable string here.
  // }
  // 要从变量声明模式中消除空值，请使用null-assert模式
  // (int?, int?) position = (2, 3);
  // var (x!, y!) = position;

  // todo Constant
  // 当值等于常量时，常量模式匹配

  // todo Variable
  // 变量位于代码区域的范围内，只有在模式匹配时才能访问。

  // todo Parenthesized-括号
  // 与带括号的表达式一样，模式中的括号允许您控制模式优先级，并在需要高优先级模式的地方插入低优先级模式。

  // todo List
  // 列表模式匹配实现List的值，然后递归地将其子模式与列表的元素匹配，以按位置分解它们：
  // var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];
  // Prints "1 2 6 7".
  // print('$a $b $c $d');
  // var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
  // Prints "1 2 [3, 4, 5] 6 7".
  // print('$a $b $rest $c $d');

  // todo  Wildcard(通配符) _
  // var list = [1, 2, 3];
  // var [_, two, _] = list;
  // print(two); // 2
}
