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
  List<ListTile> _buildList() => List.generate(
      20,
      (index) => ListTile(
            title: Text('Item_${++index}'),
          ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dialog demo'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Dialog Title'),
                          content: const Text('this is the dialog content'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('close'))
                          ],
                        );
                      });
                },
                child: const Text('showDialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('提示'),
                          content: const Text('提示内容'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('取消')),
                            TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text('确定'))
                          ],
                        );
                      });
                },
                child: const Text('AlertDialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: const Text('简单列表弹窗'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop(1);
                              },
                              child: const Text('牛排'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop(2);
                              },
                              child: const Text('羊肉'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop(3);
                              },
                              child: const Text('火腿'),
                            )
                          ],
                        );
                      });
                },
                child: const Text('SimpleDialog')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          alignment: Alignment.center,
                          child: ListView(
                            children: _buildList(),
                          ),
                        );
                      });
                },
                child: const Text('Dialog'))
          ],
        ),
      ),
    );
  }
}
