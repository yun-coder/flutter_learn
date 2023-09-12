// ({int a, int b}) recordAB = (a: 1, b: 2);
// ({int x, int y}) recordXY = (x: 3, y: 4);

// (int a, int b) _recordAB = (1, 2);
// (int x, int y) _recordXY = (3, 4);

// todo records fields
var record = ('first', a: 2, b: false, 'last');

// todo records types
(num, Object) pair = (1, 'a');

// todo records equality
(int x, int y, int z) point = (1, 2, 3);
(int r, int g, int b) color = (1, 2, 3);

({int x, int y, int z}) point2 = (x: 1, y: 2, z: 3);
({int r, int g, int b}) color2 = (r: 1, g: 2, b: 3);

// todo multiple returns
(String, int) userInfo(Map<String, dynamic> json) {
  return (json['name'] as String, json['age'] as int);
}

// todo 值的类型为动态类型
final json = <String, dynamic>{'name': 'dart', 'age': 10, 'color': 'white'};

void main() {
  // print(recordAB = recordXY); 类型不一致
  // print(_recordAB = _recordXY);
  // print(record.$1); // first
  // print(record.$2); // last
  // print(pair.$1); // 1
  // print(pair.$2); // a
  // print(point == color); // true
  // print(point2 == color2); // false

  // // todo 使用记录模式进行析构
  // var (name,age) = userInfo(json);
  // print(name); // dart
  // print(age); // 10
}
