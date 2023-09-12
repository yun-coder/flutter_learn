//构建自适应应用

// 自定义滑动行为
// Listener(
//    onPointerSignal: (event) {
//      if (event is PointerScrollEvent) print(event.scrollDelta.dy);
//    })

import 'package:flutter/material.dart';

class FormFactor extends StatelessWidget {
  const FormFactor({super.key});
  @override
  Widget build(BuildContext context) {
    final sizeInfo = SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("设备信息"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: Text('$sizeInfo'),
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double _safeAreaHorizontal = 0;
  static double _safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;

  Map<String, double> init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    return {
      'screenWidth': screenWidth,
      'screenHeight': screenHeight,
      'blockSizeHorizontal': blockSizeHorizontal,
      'blockSizeVertical': blockSizeVertical,
      '_safeAreaHorizontal': _safeAreaHorizontal,
      '_safeAreaVertical': _safeAreaVertical,
      'safeBlockHorizontal': safeBlockHorizontal,
      'safeBlockVertical': safeBlockVertical,
    };
  }
}
