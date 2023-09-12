class Animal {}

class Alligator extends Animal {}

class Cat extends Animal {}

class HoneyBadger extends Animal {}

class Lion extends Cat {}

class MaineCoon extends Cat {}

void main() {
  // todo 替换类型 消费者的角度（左侧）可以使用父类替换  生产者的角度（右侧）可以用更加具体的子类替换
  // 其中 Cat c 是 消费者 而 Cat() 是 生产者
  // Cat c = Cat();
  // 在消费者的位置，任意类型（Animal）的对象替换特定类型（Cat）的对象是安全的。
  // 因此使用 Animal c 替换 Cat c 是允许的，因为 Animal 是 Cat 的父类
  // 但是使用 MaineCoon c 替换 Cat c 会打破类型的安全性，因为父类可能会提供一种具有不同行为的 Cat
  // Animal a = Cat();
  // 在生产者的位置，可以安全地将生产类型 (Cat) 替换成一个更具体的类型 (MaineCoon) 的对象
  // Cat c1 = MaineCoon();
}
