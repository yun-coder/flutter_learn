import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Detetor"),
      ),
      body: Center(
          child: ListView(
        children: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8)),
              child: const Text("MyButton"),
            ),
            onTap: () {
              const snackBar = SnackBar(content: Text('Tap'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Tap')));
            },
            child: const Padding(
              padding: EdgeInsets.all(12),
              child: Text('InkWell Button'),
            ),
          )
        ],
      )),
    );
  }
}
