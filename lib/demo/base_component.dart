// todo 基础组件

import 'package:flutter/material.dart';

class BaseDemo extends StatelessWidget {
  const BaseDemo({super.key});

  final String fIcons = "\uE03e \uE237 \uE287";

  // TextSpan  代表文本的一个片段
  // DefaultTextStyle 设置文本默认样式
  // inherit: false 不继承默认样式
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("基础组件"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Hello, this is flutter text component demo bala bala little Moxian",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
                textScaleFactor: 1.4,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: Paint()..color = Colors.grey,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style:TextStyle(color: Colors.blue),
                ),
              ])),
              const DefaultTextStyle(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, // todo 不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                child: const Text("ElevatedButton"),
                onPressed: () {
                  // print('ElevatedButton');
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: () {
                  // print('ElevatedButton.icon');
                },
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () {
                  // print('OutlinedButton.icon');
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.info),
                label: const Text("详情"),
                onPressed: () {
                  // print('TextButton.icon');
                },
              ),
              // TextButton(
              //   child: const Text("TextButton"),
              //   onPressed: () {
              //     print("TextButton");
              //   },
              // ),
              // OutlinedButton(
              //   child: const Text('OutlinedButton'),
              //   onPressed: () {
              //     print('OutlinedButton');
              //   },
              // ),
              // IconButton(
              //     icon: const Icon(Icons.thumb_up),
              //     onPressed: () {
              //       print("IconButton");
              //     }),
              // const Image(image: AssetImage("images/snack.png"), width: 100.0),
              // Image.asset(
              //   "images/snack.png",
              //   width: 100.0,
              // ),
              // todo 加载网络图片
              // const Image(
              //   image: NetworkImage(
              //       "https://avatars2.githubusercontent.com/u/20411650?s=460&v=1"),
              //   width: 100.0,
              //   color: Colors.blue,
              //   colorBlendMode: BlendMode.difference,
              // ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411650?s=460&v=1",
                width: 100.0,
              ),
              // todo 图标
              Text(fIcons,
                  style: const TextStyle(
                      fontFamily: "MaterialIcons",
                      fontSize: 40.0,
                      color: Colors.green)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(MyIcons.weChat, color: Colors.green),
                  Icon(MyIcons.aliPay, color: Colors.green)
                ],
              ),
              const SwitchAndCheckboxTestState(),
            ],
          ),
        ));
  }
}

// todo Icons类 用于使用自定义字体图标 在flutter中使用ttf格式
class MyIcons {
  // todo 使用自定义图标库有问题
  // const Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: <Widget>[
  //     Icon(MyIcons.weChat, color: Colors.green),
  //     Icon(MyIcons.aliPay, color: Colors.green)
  //   ],
  // ),
  static const IconData weChat =
      IconData(0xe658, fontFamily: 'Corben', matchTextDirection: true);
  static const IconData aliPay =
      IconData(0xe87c, fontFamily: 'Corben', matchTextDirection: true);
}

// todo 单选开关和复选框
class SwitchAndCheckboxTestState extends StatefulWidget {
  const SwitchAndCheckboxTestState({super.key});

  @override
  SwitchAndCheckBoxTestRouteState createState() =>
      SwitchAndCheckBoxTestRouteState();
}

class SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckboxTestState> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            tristate: false, // 为true多了一个null的状态
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                // print(value);
                _checkboxSelected = value!; // 有可能是null
              });
            })
      ],
    );
  }
}
