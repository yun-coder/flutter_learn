import 'package:flutter/material.dart';

class BasicHeroAnimation extends StatelessWidget {
  const BasicHeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("basic hero animation"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("flip's page"),
                  backgroundColor: Colors.blue.shade500,
                ),
                body: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Hero(
                    tag: 'flippers',
                    child: SizedBox(
                      width: 100,
                      child: Image.asset('images/flippers.png'),
                    ),
                  ),
                ),
              );
            }));
          },
          child: Hero(
            tag: 'flippers',
            child: Image.asset('images/flippers.png'),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BasicHeroAnimation(),
  ));
}
