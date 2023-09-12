// todo 包管理
// todo 根目录 pubspec.yaml 文件添加包名  pub get 后在dart Packages 目录下

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// todo 生成随机字符串
class RandomWordsWidget extends StatelessWidget {
  const RandomWordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: const Text('包的使用'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(wordPair.toString()),
        ),
      ),
    );
  }
}
