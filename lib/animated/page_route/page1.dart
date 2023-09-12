import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("主页"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text("GO"),
        ),
      ),
    );
  }
}

// 路由转换
Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        // chain 链条 连续
        // final tween = Tween(begin: begin, end: end);
        // final offsetAnimation = animation.drive(tween);
        var tween =Tween(begin: begin,end: end).chain(CurveTween(curve:curve));
        // final curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
        // 从下往上
        return SlideTransition(
          position: animation.drive(tween),
          // position: tween.animate(curvedAnimation),
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二页"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text("page 2"),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Page1(),
  ));
}
