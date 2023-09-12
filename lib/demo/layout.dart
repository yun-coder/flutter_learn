// ----------------------------
  // 详情页布局示例
// ----------------------------



// todo  Container 是一个 widget，允许你自定义其子 widget。
// 如果要添加 padding、margin、边框或背景颜色，你就可以用上 Container 了
// todo Row ==> ListTitle Column ==> ListView
// todo  mainAxisAlignment x水平延伸
// todo  crossAxisAlignment  y轴水平延伸

import 'package:flutter/material.dart';

class CustomLayout extends StatefulWidget {
  const CustomLayout({super.key});

  @override
  State<CustomLayout> createState() => _Layouts();
}

class _Layouts extends State<CustomLayout> {
  // todo 只适用于 web 端
  // todo 通过使用 Expanded widget，可以调整 widgets 的大小以适合行或列
  var imgLine = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image.asset('images/snack.png'),
      ),
      Expanded(
        flex: 2, // todo 这是一个用来确定 widget 的弹性系数的整数。默认的弹性系数为 1
        child: Image.asset('images/snack.png'),
      ),
      Expanded(
        child: Image.asset('images/snack.png'),
      ),
    ],
  );

  // todo dart 中你不能创建一个类级别的变量依赖于另一个变量
  // todo 1、解决方案 将变量移动到构建方法中
  // todo 2、可以将它们定义为 getter   Widget get stars =>
  // todo 3、另一种方法是将stars 变量定义为静态 变量
  static final stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.grey.shade400),
      Icon(Icons.star, color: Colors.grey.shade400),
      Icon(Icons.star, color: Colors.grey.shade400),
      const Icon(Icons.star, color: Colors.blue),
      const Icon(Icons.star, color: Colors.blue),
    ],
  );

  static final ratings = Container(
    padding: const EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        stars,
        const Text(
          '130 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

  static const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2);

  static final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        // margin: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text("test"),
                const Text("25 min")
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text("test"),
                const Text("25 min")
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text("test"),
                const Text("25 min")
              ],
            ),
          ],
        ),
      ));

  static final leftColumn = Container(
    padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
    child: Column(
      children: [ratings, iconList],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("简单布局"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[imgLine, leftColumn],
        ),
      ),
    );
  }
}
