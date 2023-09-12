import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightBlue[500],
          fontFamily: "Georgia",
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontSize: 18, fontStyle: FontStyle.normal,color: Colors.white),
              bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text("主题样式"),
        ),
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Text('Text with a background color',
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
        floatingActionButton: Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.purple),
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )));
  }
}
