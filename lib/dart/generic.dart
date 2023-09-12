// todo 泛型

// T  是一个备用类型。 这是一个类型占位符，在开发者调用该接口的时候会指定具体类型。
abstract class Cache<T> {
  T getByKey(String key);

  void setByKey(String key, T value);
}

// 限制泛型类型 T 继承自 Base类 参数类型固定
class Base {}

class Test<T extends Base> {}

void main() {
  // 使用集合字面量
  // var names = <String>['Seth', 'Kathy', 'Lars'];
  // var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
  // var pages = <String, String>{
  //   'index.html': 'Homepage',
  //   'robots.txt': 'Hints for web robots',
  //   'humans.txt': 'We are people, not machines'
  // };
  // print(pages is Map<String,String>); // todo 判断类型

  // 在调用构造函数的时，在类名字后面使用尖括号（<...>）来指定泛型类型
  // var nameSet = Set<String>.from(names);
  // 下面代码创建了一个 key 为 integer， value 为 String 的 map 对象
  // var views = Map<int, String>();

  // 这里的 Base 类型就是固定的不能变了
  // var test = Test<Base>();

  // 使用泛型函数 函数返回的类型是T  参数类型是 List<T>  局部变量 T tmp
  // T getName<T>(List<T> arg) {
  //   T tmp = arg[0];
  //   return tmp;
  // }
}
