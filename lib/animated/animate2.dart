//  AnimatedOpacity  一般会使用不透明动画让元素淡入淡出，以创建出更加流畅的用户体验

import 'package:flutter/material.dart';
// 淡入淡出效果
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimatedOpacityApp(),
    );
  }
}

class AnimatedOpacityApp extends StatefulWidget {
  const AnimatedOpacityApp({super.key});

  @override
  State<AnimatedOpacityApp> createState() => _AnimatedOpacityAppState();
}

class _AnimatedOpacityAppState extends State<AnimatedOpacityApp> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedContainer"),
      ),
      body: Center(
          child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child: const Icon(Icons.flip),
      ),
    );
  }
}
