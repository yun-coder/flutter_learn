// dart 语言类型

// 若 late 标记的变量在使用前没有初始化，在变量被使用时会抛出运行时异常。
// todo 仅当代码不清楚导致编译器无法确定代码是否初始化了变量时，才对局部变量使用late。
late String desc;

// todo Isolates
// 所有 Dart 代码都在隔离区（ isolates ）内运行，而不是线程。

// 类型修饰符
// todo late
// todo abstract 抽象类  可以继承 可以实例化  不能构造
// todo base  基类   可以构造 可以继承 不能实例化
// todo final  可以构造 不能继承  不能实例化
// todo interface  接口  可以构造 可以实例化  不能继承
// todo sealed(密封)  自身无法实例化 子类可以实例化
// todo mixin  Mixin 是复用类代码的一种途径， 复用的类可以在不同层级，之间可以不存在继承关系
// todo Isolate  隔离区  async await 异步编程

class Television {
  // todo 废弃的
  @Deprecated("Use [turnOn] instead._")
  void activate() {
    turnOn();
  }

  void turnOn() {}
}

// todo typedef
// 在 Dart 中，函数也是对象，就想字符和数字对象一样。
// 使用 typedef ，或者 function-type alias 为函数起一个别名， 别名可以用来声明字段及返回值类型。
// 当函数类型分配给变量时，typedef会保留类型信息。
typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

typedef IntList = List<int>;

void main(List<String> arguments) {
  // todo 任何保存在变量中的都是一个 对象 ， 并且所有的对象都是对应一个 类 的实例。 无论是数字，函数和 null 都是对象。所有对象继承自 Object 类
  // todo 如果标识符以下划线（_）开头，则它相对于库是私有的
  // todo Dart 工具提示两种类型问题：警告_和_错误
  // todo 未初始化的变量默认值是 null
  // todo 内建类型 Number  String  Boolean List (也被称为 Array) Map Set Rune (用于在字符串中表示 Unicode 字符) Symbol
  // todo int 整数值不大于64位， 具体取决于平台。 在 Dart VM 上， 值的范围从 -263 到 263 - 1.
  // todo Dart 被编译为 JavaScript 时，使用 JavaScript numbers, 值的范围从 -253 到 253 - 1.

  // print(sort is Compare<int>);
  // IntList il = [1, 2, 3];

  var (a, b) = ('left', 'right');
  (b, a) = (a, b); // 交换
  // print('$a $b'); // right left

  // print('void main 默认参数 ${arguments}'); // []

  // todo 默认值 null  Dart 中一切皆为对象数字也不例外
  // int? lineCount;
  // assert(lineCount == null);

  // todo 若 late 标记的变量在使用前没有初始化，在变量被使用时会抛出运行时异常。
  desc = "延迟初始化的一个变量";
  // print(desc);

  // Final 变量的值只能被设置一次
  // todo Const 变量的值不可以修改
  // final name = "test";
  // final String nickName = "test2";
  // name = "test3";// Error: Can't assign to the final variable 'name'.

  // todo 字符串和数字的转换  int.parse()  double.parse()  .toString()  .toStringAsFixed(2)
  // String => int
  var one = int.parse('1');
  assert(one == 1);
  // String => double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  // int => String
  String oneAsString = 1.toString();
  assert(oneAsString == "1");
  // double => String
  String numAsString = 3.1415927.toStringAsFixed(2);
  assert(numAsString == '3.14');

  // 在字符串前面 r 作为前缀即为 raw 字符串 不会做任何处理
  // var s3 = r'in a raw string,not even \n gets special treatment';
  // print(s3);

  // todo  字符串  字符串通过单引号或者双引号创建
  // todo  使用连续三个单引号或者三个双引号实现多行字符串对象的创建
  // var s1 = '''可以创建多行字符串，
  // 可以换行的
  // ''';
  // var s2 = """
  //   这种也是可以多行的
  //   呵呵
  // """;
  // print('s1:' + s1);
  // print('s2:' + s2);
  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, which is very handy.');
  assert('That deserves all caps. ${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. STRING INTERPOLATION is very handy!');

  // todo  布尔类型判断 isEmpty  isNaN
  // var fullName = "";
  // print(fullName.isEmpty);
  // var isZero = 0;
  // print(isZero == 0);
  // var unicorn;
  // assert(unicorn == null);
  // var isMeanToDoThis = 0 / 0;
  // print(isMeanToDoThis.isNaN);

  // todo 集合 List
  // 可以在 Dart 的集合类型的最后一个项目后添加逗号。这个尾随逗号并不会影响集合，但它能有效避免「复制粘贴」的错误
  // var lists = [1, 2, 3];
  // 字面量前面加上 const 会创建一个编译时常量
  // var constantList = const [1, 3, 4];
  // 扩展操作符 ... 和 空感知扩展操作符 ...?
  // var list1 = null;
  // 扩展操作符右边可能为 null 可以使用 null-aware 扩展操作符（...?）来避免产生异常
  // var list2 = [4, ...lists, ...?list1]; // [4, 1, 2, 3]
  // print(list2);
  // 构建集合 使用条件判断(if)和(for)
  // var nav = ["test", "name", if (lists.length > 1) 'hehe'];
  // print(nav); //[test, name, hehe]
  // var listsOfString = ['#0', for (var i in lists) '#$i'];
  // print(listsOfString); // [#0, #1, #2, #3]
  // 列表模式匹配实现List的值，然后递归地将其子模式与列表的元素匹配，以按位置分解它们：
  // var [a, b, ..., c, d] = [1, 2, 3, 4, 5, 6, 7];
  // Prints "1 2 6 7".
  // print('$a $b $c $d');
  // var [a, b, ...rest, c, d] = [1, 2, 3, 4, 5, 6, 7];
  // Prints "1 2 [3, 4, 5] 6 7".
  // print('$a $b $rest $c $d');

  // todo Set 一组特定元素的无序集合 （类型推断）类型需要保持一致
  var setStr = {"my", "name", "is", "da"};
  // 要创建一个空集，使用前面带有类型参数的 {} ，或者将 {} 赋值给 Set 类型的变量：
  var names = <String>{};
  // Set<String> names2 = {};
  //使用 add() 或 addAll() 为已有的 Set 添加元素
  names.addAll(setStr);
  names.add("!");
  // print(names); // {my, name, is, da, !}
  // print(names.length == 5);

  // todo Map
  // Map 是用来关联keys和values的对象。键和值可以是任何类型的对象，每个键只能出现一次但是值可以重复出现多次
  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 'golden rings'
  // };
  // gifts['first'] = 'partridge';
  // gifts['second'] = 'turtledoves';
  // gifts['fifth'] = 'golden rings';

  var gifts2 = <int, String>{1: 'hehe'};
  gifts2[1] = "haha";
  // print(gifts2); // {1: haha}
  // 如果检索的key不存在于Map 中则会返回一个null
  // print(gifts['three'] == null); //true
  // 在一个 Map 字面量前添加 const 关键字可以创建一个 Map 编译时常量
  // var constantMap = const {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 'argon',
  // };

  // todo  Rune
  // 在 Dart 中， Rune 用来表示字符串中的 UTF-32 编码字符
  // \uXXXX, 这里 XXXX 是一个4位的16进制数
  // 对于特殊的非 4 个数值的情况， 把编码值放到大括号中即可 \u{1f600}

  // todo Symbol
  // 也许永远都不需要使用 Symbol ，但要按名称引用标识符的 API 时， Symbol 就非常有用
  //  通过字面量 Symbol ，也就是标识符前面添加一个 # 号，来获取标识符的 Symbol
  // print(#radix); // Symbol("radix")

  // todo dynamic 任何类型的类型 动态类型类似于 ts 中的 any
  // todo Numbers (int, double)
  // todo Strings (String)
  // todo Booleans (bool)
  // todo Lists (List, also known as arrays)
  // todo Sets (Set)
  // todo Maps (Map)
  // todo Runes (Runes; often replaced by the characters API)
  // todo Symbols (Symbol)
  // todo The value null (Null)
  // todo Records 记录
  // todo Collections 集合
  // todo Generics 泛型
  // todo Typedefs 别名

  // 错误码  0	Success   1	Warnings  2	Errors
}
