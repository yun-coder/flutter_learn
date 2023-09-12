//  ReverseAnimation  效果是复制一个动画但是将其反向运行（比如从 1.0 到 0.0）
//  CurvedAnimation，效果是用 Curve 来调整动画的值。
//  补间动画  如果想要在 0.0 到 1.0 的区间之外设置动画，可以使用 Tween<T> 它可以在它的 begin 值和 end 值之间进行插值补间

//  你可以用 evaluate 方法处理动画的当前值从而得到对应的插值。这种方法对于已经监听动画并因此在动画改变值时重新构建的 widgets 是最有效的。
//  你可以用 animate 方法处理一个动画。相对于返回单个值，animate 方法返回一个包含补间动画插值的新的 Animation。
//  这种方法对于当你想要将新创建的动画提供给另一个 widget 时最有效，它可以直接读取包含补间动画的插值以及监听对应插值的更改。

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '交错菜单',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      home: const StaggerMenu(),
    );
  }
}

class StaggerMenu extends StatefulWidget {
  const StaggerMenu({super.key});

  @override
  State<StaggerMenu> createState() => _StaggerMenuState();
}

class _StaggerMenuState extends State<StaggerMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    // 动画还提供了一个 AnimationStatus，表示动画将如何随时间进行变化。每当动画的状态发生变化时，动画都会通知所有通过 addStatusListener 添加的监听器
    // 正向播放 forward
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      // 收回 反向动画
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: Stack(
          children: [_buildContent(), _buildDrawer()],
        ));
  }

  // 预先渲染的饿标题头
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        title: const Text("交错菜单"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,// 自动隐含引导
        actions: [
          // AnimatedBuilder 希望将动画作为复杂 widgets 的 build 方法的其中一部分
          AnimatedBuilder(
              animation: _drawerSlideController,
              builder: (context, child) {
                return IconButton(
                    onPressed: _toggleDrawer,
                    icon: _isDrawerOpen() || _isDrawerOpening()
                        ? const Icon(
                            Icons.clear,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ));
              })
        ]);
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
        animation: _drawerSlideController,
        builder: (context, child) {
          return FractionalTranslation(
            translation: Offset(1.0 - _drawerSlideController.value, 0.0),
            child: _isDrawerClosed() ? const SizedBox() : const Menu(),
          );
        });
  }

  Widget _buildContent() {
    return const SizedBox();
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuItems = [
    'menu one',
    'menu two',
    'menu three',
    'menu four',
    'menu five',
  ];
  late AnimationController _controller;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuItems.length) +
      _buttonDelayTime +
      _buttonTime;

  @override
  void initState() {
    super.initState();
    _createAnimationIntervals();
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      bottom: -30,
      child: Opacity(
        opacity: 0.2,
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        ..._buildListItems(),
        const Spacer(),
        _buildGetStartedButton(),
      ],
    );
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuItems.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds));
    }
    final buttonStartTime =
        Duration(milliseconds: (_menuItems.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
        buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
        buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds);
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuItems.length; ++i) {
      listItems.add(AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final animationPercent = Curves.easeOut
              .transform(_itemSlideIntervals[i].transform(_controller.value));
          final opacity = animationPercent;
          final slideDistance = (1.0 - animationPercent) * 150;
          return Opacity(
            opacity: opacity,
            child: Transform.translate(
              offset: Offset(slideDistance, 0),
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          child: Text(
            _menuItems[i],
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
      ));
    }
    return listItems;
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final animationPercent = Curves.elasticOut
                  .transform(_buttonInterval.transform(_controller.value));
              final opacity = animationPercent.clamp(0.0, 1.0);
              final scale = (animationPercent * 0.5) + 0.5;
              return Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: child,
                ),
              );
            },
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 14)),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              onPressed: () {},
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }
}
