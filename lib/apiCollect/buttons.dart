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

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('按钮集合'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('$counter'),
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20))),
                onPressed: _increment,
                child: const Text(
                  'TextButton',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8))),
                onPressed: _increment,
                child: const Text('ElevatedButton',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
                onPressed: _increment,
                child: const Text(
                  'OutlinedButton',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 10,
            ),
            FilledButton(
                onPressed: _increment,
                child: const Text('FilledButton',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                iconSize: 20.0,
                onPressed: _increment,
                icon: const Icon(Icons.add)),
            const SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: _increment,
                icon: const Icon(Icons.arrow_right),
                label: const Text('添加'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _increment, child: const Icon(Icons.add)),
    );
  }
}
