import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹出样式菜单"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: PopupMenuTheme(
            data: PopupMenuTheme.of(context).copyWith(
                color: Colors.orangeAccent,
                elevation: 1,
                textStyle: const TextStyle(color: Colors.white),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(5)))),
            child: _PopupMenuDemo()),
      ),
    );
  }
}

class _PopupMenuDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<_PopupMenuDemo> {
  final Map<String, IconData> map = {
    "关于": Icons.info_outline,
    "帮助": Icons.help_outline,
    "反馈": Icons.add_comment,
  };

  List<PopupMenuItem<String>> buildItems() {
    return map.keys
        .toList()
        .map((e) => PopupMenuItem(
            value: e,
            child: Wrap(
              spacing: 6,
              children: [Icon(map[e]), Text(e)],
            )))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => buildItems(),
      offset: const Offset(0, 50),
      onSelected: print,
      onCanceled: () => print('canceled'),
    );
  }
}
