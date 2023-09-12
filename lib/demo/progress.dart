// todo 进度条
import 'package:flutter/material.dart';

class CustomProgress extends StatefulWidget {
  const CustomProgress({super.key});

  @override
  State<CustomProgress> createState() => _CreateProcess();
}

class _CreateProcess extends State<CustomProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationController.forward();
    _animationController.addListener(() => setState(() {}));
    // implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    // implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("进度条"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(_animationController),
                  value: _animationController.value,
                ),
              ),
              // 线性进度条高度指定为3
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              // 圆形进度条直径指定为100
              SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
