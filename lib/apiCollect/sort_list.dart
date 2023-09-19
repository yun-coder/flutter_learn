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
  final List<Color> items = [
    Colors.yellow[50]!,
    Colors.yellow[100]!,
    Colors.yellow[200]!,
    Colors.yellow[300]!,
    Colors.yellow[400]!,
    Colors.yellow[500]!,
    Colors.yellow[600]!,
    Colors.yellow[700]!,
    Colors.yellow[800]!,
    Colors.yellow[900]!,
  ];

  String colorString(Color color) =>
      "#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}";

  void _handleReorder(int oldIndex, int newIndex) {
    if (oldIndex > newIndex) {
      newIndex -= 1;
    }

    setState(() {
      final element = items.removeAt(oldIndex);
      items.insert(newIndex, element);
    });
  }

  Widget _buildItem(Color color) {
    return Container(
      key: ValueKey(color),
      alignment: Alignment.center,
      height: 50, // vertical  方向设置高度
      color: color,
      child: Text(
        colorString(color),
        style: const TextStyle(color: Colors.white, shadows: [
          Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
        ]),
      ),
    );
  }

  Widget _buildHorizontalItem(Color color) {
    return Container(
      key: ValueKey(color),
      alignment: Alignment.center,
      width: 80, // horizontal 方向设置宽度
      color: color,
      child: Text(
        colorString(color),
        style: const TextStyle(color: Colors.white, shadows: [
          Shadow(color: Colors.black, offset: Offset(.5, .5), blurRadius: 2)
        ]),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("可排序列表"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: ReorderableListView(
              padding: const EdgeInsets.all(10),
              header: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  '长按拖拽进行换位',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onReorder: _handleReorder,
              children: items.map((e) => _buildItem(e)).toList(),
            ),
          ),
          const SizedBox(height: 100,),
          SizedBox(
            height: 300,
            child: ReorderableListView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onReorder: _handleReorder,
              children: items.map((e) => _buildHorizontalItem(e)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
