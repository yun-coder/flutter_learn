import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(
      title: 'write&read demo',
      storage: CountStorage(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.title, required this.storage});

  final String title;
  final CountStorage storage;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _count = 0;

  Future<File> _incrementCount() {
    setState(() {
      _count++;
    });
    return widget.storage.writeCount(_count);
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCount().then((value) {
      setState(() {
        _count = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文件读写'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Button tapped $_count time${_count == 1 ? '' : 's'}.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCount,
        tooltip: '修改文件数据',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CountStorage {
  Future<String> get _localPath async {
    final dictionary = await getApplicationDocumentsDirectory();
    return dictionary.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/count.txt');
  }

  Future<int> readCount() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return int.parse(contents);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCount(int count) async {
    final file = await _localFile;
    return file.writeAsString('$count');
  }
}
