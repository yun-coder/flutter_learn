// 流程控制语句
void main() {
  // if(){}else{}  判断条件必须是布尔值，不能是其他类型
  // if case
  // todo if (pair case [int x, int y]) return Point(x, y);  version >3.0
  // for(let k=0;k<10;k++){}
  // for in (Map List)
  // forEach
  // while  先判断条件再执行循环
  // do-while 先循环一遍再执行条件
  // break  中断循环
  // continue 跳过本次循环直接进入下一次循环
  // switch case  适合枚举类型

  // assert 断言   生产环境中断言会被忽略
  // Dart 中的for循环中的闭包会自动捕获循环的索引值 不会出现JavaScript中的2个2
  // var callbacks = [];
  // for (var k = 0; k < 2; k++) {
  //   callbacks.add(() => print('k:$k'));
  // }
  // 遍历的对象是一个可迭代对象（List 和 Set）
  // for (final i in callbacks) {
  //   i(); // k:0  K:1
  // }
  // 可迭代对象
  // var arr = [1, 2, 3];
  // arr.forEach((element) {
  //   print(element); // 1 2 3
  // });

  // assert(arr.length > 4, '大于3个？');

  // var command = 'CLOSED';
  // switch (command) {
  //   case 'CLOSED':
  //     print('1');
  //     continue nowClosed; // 在非空 case 中实现 fall-through 形式， 可以使用 continue 语句结合 lable 的方式实现
  //   nowClosed:
  //   case 'NOW_CLOSED':
  //     // Runs for both CLOSED and NOW_CLOSED.
  //     print('2');
  //     break;
  // }

  // MapEntry
  // Map<String, int> hist = {'a': 123, 'b': 100};
  // for (var MapEntry(key: key, value: count) in hist.entries) {
  //   print('$key=>$count');
  // }

  // todo 对象模式与命名对象类型匹配，允许您使用对象的类已经公开的getter来解构它们的数据。
  // todo 要解构类的实例，请使用命名类型，然后使用要解构的属性（括在圆括号中）
  // final Foo myFoo = Foo(one: 'one', tow: 2);
  // var Foo(:one, :two) = myFoo;
}
