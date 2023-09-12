// Widget 的物理模拟动画效果 让它看起来就像安着弹簧，或是在随重力下落
//  GestureDetector 手势检测器

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: "模拟物理效果",
      home: const PhysicsCardDragDemo(),
    );
  }
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("模拟物理效果"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const DraggableCard(child: FlutterLogo(size: 128)),
    );
  }
}

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key, required this.child});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCarState();
}

class _DraggableCarState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Alignment _alignment = Alignment.center;
  late Animation<Alignment> _animation;

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller
        .drive(AlignmentTween(begin: _alignment, end: Alignment.center));

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY); // 单位每秒
    final unitVelocity = unitsPerSecond.distance; // 单位速度
    //  mass-质量 stiffness-刚度  damping-阻尼
    const spring = SpringDescription(mass: 30, stiffness: 1, damping: 1);
    // simulation 模拟
    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
  }

  @override
  void initState() {
    super.initState();
    // vsync 帧同步
    _controller = AnimationController(vsync: this);

    _controller.addListener(() {
      setState(() {
        _alignment = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _alignment += Alignment(details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2));
        });
      },
      onPanEnd: (details) {
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: _alignment,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
