// getter 和 setter 的用法
class InvalidPriceException {}

//想象你有一个购物车类，其中有一个私有的 List<double> 类型的 prices 属性。添加以下内容：
// 一个名为 total 的 getter，用于返回总价格。
// 只要新列表不包含任何负价格， setter 就会用新的列表替换列表（在这种情况下，setter 应该抛出 InvalidPriceException）。

class ShoppingCart {
  List<double> _prices = [];

  // todo fold 所有列表项相加
  double get total => _prices.fold(0, (e, t) => e + t);

  // todo any 列表值过滤
  set prices(List<double> value) {
    if (value.any((p) => p < 0)) {
      throw InvalidPriceException();
    }

    _prices = value;
  }
}

class Cache<T> {
  void setByKey(String key, T value) {}
}

// todo Getter 和 Setter
// Getter 和 Setter 是用于对象属性读和写的特殊方法
class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // 定义两个计算属性： right 和 bottom。
  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

class Person {
  int _age = 0;

  int get age {
    return _age;
  }

  set age(int value) {
    if (value < 0) {
      throw ArgumentError('Age cannot be negative');
    }
    _age = value;
  }
}

void main() {
  // Creating a cache for strings
  var stringCache = Cache<String>(); // stringCache has type Cache<String>
  stringCache.setByKey('Foo', 'Bar'); // Valid, setting a string value.

  var person = Person();
  person.age = 10;
  // print(person.age);

  var rect = Rectangle(3, 4, 20, 15);
  // print('Rectangle.left:  ${rect.left == 3}');
  rect.right = 12;
  // print('Rectangle.left:  ${rect.left == -8}'); // 12 - 20 触发类内部函数运算

  // var foundException = false;
  try {
    final cart = ShoppingCart();
    cart._prices = [12.0, 12.0, -11.1];
  } on InvalidPriceException {
    // foundException = true;
  } catch (e) {
    // print(
    //     'Tried setting a negative price and received a ${e.runtimeType} instead of an InvalidPriceException');
  }
}
