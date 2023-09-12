//----------------------------
//  图标在3秒内从0转换到300
//----------------------------

//  Animation Flutter 动画库中的核心类，插入用于指导动画的值。
//  Animation forward()  stop()  animateBack()  对象知道动画目前的状态（例如，是否开始，暂停，前进或倒退），但是对屏幕上显示的内容一无所知。
//  AnimationController 管理 Animation。
//  CurvedAnimation 定义进程为非线性曲线。  curve 曲线
//  Tween 为动画对象插入一个范围值。例如，Tween 可以定义插入值由红到蓝，或从 0 到 255。
// 使用 Listeners 和 StatusListeners 监视动画状态变化。

import 'package:flutter/material.dart';

void main() {
  runApp(const LogoApp());
}

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}
