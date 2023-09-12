// todo 指针 Pointer
// PointerDownEvent   指针在特定位置与屏幕接触
// PointerMoveEvent   指针从屏幕的一个位置移动到另外一个位置
// PointerUpEvent     指针与屏幕停止接触
// PointerCancelEvent 指针的输入已经不再指向此应用

import 'package:flutter/material.dart';
import 'package:my_app1/gestures/order_cart.dart';
import 'package:my_app1/gestures/tap_button.dart';
import 'package:my_app1/gestures/dismiss_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gesture 手势",
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MyHomePage(title: "Gesture Demo"),
        "customButton": (context) => const MyButton(),
        "orderCart": (context) => const CustomOrderToCart(),
        "diss_item": (context) => const CustomDissItem(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _TestPage();
}

class _TestPage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: const Text("自定义按钮"),
                  onPressed: () {
                    Navigator.pushNamed(context, "customButton");
                  },
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: const Text("加入购物车"),
                  onPressed: () {
                    Navigator.pushNamed(context, "orderCart");
                  },
                )),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: ElevatedButton(
                  child: const Text("滑动清除"),
                  onPressed: () {
                    Navigator.pushNamed(context, "diss_item");
                  },
                )),
          ],
        ),
      ),
    );
  }
}
