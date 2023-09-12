import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _FormDemo();
}

class _FormDemo extends State<CustomForm> {
  final _myController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  // 释放widget时清理控制器
  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // todo 设置默认值
    _myController.text = "Hello!";
    // todo baseOffset 基准偏移
    // todo extentOffset 范围偏移
    _myController.selection =
        TextSelection(baseOffset: 0, extentOffset: _myController.text.length);
    // todo 监听值的变化
    _myController.addListener(() {
      // print(_myController.text);
    });
    focusNode2.addListener(() {
      // print(focusNode2.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("输入框和表单"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Colors.grey.shade400, width: 1.0))),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none
                  // todo 通过设置主题色也能改变
                  //           Theme(
                  //               data: Theme.of(context).copyWith(
                  //                   hintColor: Colors.grey[200],
                  //                   inputDecorationTheme: const InputDecorationTheme(
                  //                       labelStyle: TextStyle(color: Colors.grey),
                  //                       hintStyle:
                  //                           TextStyle(color: Colors.grey, fontSize: 14.0))),
                  // enabledBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.grey)),
                  // focusedBorder: UnderlineInputBorder(
                  //     borderSide: BorderSide(color: Colors.blue))
                  ),
              // onChanged: (value) {
              //   print(value);
              // },
              controller: _myController,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Colors.grey.shade400, width: 1.0))),
            child: TextField(
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none),
              // todo 是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换
              obscureText: true,
              onChanged: (value) {
                // print(value);
              },
              focusNode: focusNode2,
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      // FocusScope.of(context).requestFocus(focusNode2);
                      focusScopeNode ??= FocusScope.of(context);
                      focusScopeNode?.requestFocus(focusNode2);
                    },
                    child: const Text("移动焦点")),
                ElevatedButton(
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                    child: const Text("隐藏键盘")),
              ],
            );
          })
        ],
      )),
    );
  }
}
