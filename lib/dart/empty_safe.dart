// 空安全

class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });

  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
      anInt: newInt ?? anInt,
      aString: newString ?? aString,
      aDouble: newDouble ?? aDouble,
    );
  }
}

main() {
  // 通过在类型后添加 ? 来表示该类型可空
  // int? a; // int类型默认值可以为null
  // String? name = "HI";

  // ??  如果该运算符左边的表达式返回的是空值，则会计算并返回右边的表达式
  // String? foo = 'a string';
  String? bar;
  // String? baz = foo ?? bar;

  // ??= 仅当该变量为空值时才为其赋值：
  bar ??= 'a string';

  // 条件属性访问
  // 要保护可能会为空的属性的正常访问，请在点（.）之前加一个问号（?）
  // myObject?.someProperty;
  // myObject?.someProperty?.someMethod()

  // 集合字面量
  // final aListOfStrings = ['a', 'b', 'c'];
  // final aSetOfInts = {3, 4, 5};
  // final aMapOfStringsToInts = {'myKey': 12};
  // final anEmptyListOfDouble = <double>[];
  // final anEmptySetOfString = <String>{};
  // final anEmptyMapOfDoublesToInts = <double, int>{};

  // todo 可选参数 [默认 null]
  // String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
  //   var total = '$a';
  //   if (b != null) total = '$total,$b';
  //   if (c != null) total = '$total,$c';
  //   if (d != null) total = '$total,$d';
  //   if (e != null) total = '$total,$e';
  //   return total;
  // }
  // print(joinWithCommas(1));
  // print(joinWithCommas(1, 2, 3));
  // print(joinWithCommas(1, 1, 1, 1, 1));

  // todo 命名参数 {默认 null}
  void printName(String firstName, String lastName, {String? middleName}) {
    // print("${firstName} ${middleName ?? ''} ${lastName}");
  }

  printName('John', 'Smith', middleName: 'well');
}
