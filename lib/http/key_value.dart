// 存储键值对数据 保存到硬盘中-持久化存储  shared_preferences 没有值返回的是null
//-------------------------
// SharedPreferences.getInstance()  只能用于基础类型：int、double、bool、string 和 stringList。
//-------------------------
// setInt setBool setString
// getInt getBool getString
// remove()  移除数据

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'key_value 存储',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 0;

  Future<void> _loadCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = prefs.getInt('counter') ?? 0;
    });
  }

  Future<void> _incrementCount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _count);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shared_preference demo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('pushed times'),
            Text(
              '$_count',
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: 'key_value',
        child: const Icon(Icons.add),
      ),
    );
  }
}
