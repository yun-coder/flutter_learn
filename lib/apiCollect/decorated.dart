import 'dart:math' as math;

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

// 自定义裁剪路径
class ClipperOvalPath extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // 返回裁剪区域
    return Rect.fromLTRB(10, 0, size.width - 10, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    // 判断是否需要重新裁剪，如果区域始终不变直接返回false
    return false;
  }
}

class _MyAppState extends State<MyApp> {
  Matrix4 transFormMatrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    transFormMatrix.translate(100, 20);
    transFormMatrix.rotateZ(math.pi / 2);
    transFormMatrix.scale(1.1);
    return Scaffold(
        appBar: AppBar(
          title: const Text('装饰器'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.orange.shade700]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 4.0)
                  ]),
              child: const FlutterLogo(
                size: 60,
              ),
            ),
            // Transform(
            //   transform: transFormMatrix,
            //   child: const Text(
            //     'origin',
            //     style: TextStyle(color: Colors.blueAccent),
            //   ),
            // ),
            Transform.translate(
              offset: const Offset(100.0, 10.0),
              child: const Text(
                'translate',
                style: TextStyle(color: Colors.green),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 2,
              child: const Text(
                'rotate',
                style: TextStyle(color: Colors.green),
              ),
            ),
            Transform.scale(
              scale: 2,
              child: const Text(
                'scale',
                style: TextStyle(color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const RotatedBox(
              quarterTurns: 1,
              child: Text(
                'RotateBox',
                style: TextStyle(color: Colors.red),
              ),
            ),
            // ClipOval(
            //   child: Image.asset('images/lake.jpg'),
            // ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10.0),
            //   child: Image.asset('images/lake.jpg'),
            // ),
            // ClipRect(
            //     child: SizedBox(
            //   width: 100,
            //   height: 100,
            //   child: Image.asset('images/lake.jpg'),
            // )),
          ],
        ));
  }
}
