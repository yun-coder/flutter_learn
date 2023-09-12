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

  var listView1 = SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => Text('first list ${++index}'),
          childCount: 10),
      itemExtent: 60);
  var listView2 = SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
          (_, index) => Text('second list ${++index}'),
          childCount: 10),
      itemExtent: 60);

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('滚动组件'),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: _buildList(),
      //   ),
      // ),
      // body: PageView(
      //   children: const [
      //     Icon(Icons.car_crash),
      //     Icon(Icons.car_crash),
      //     Icon(Icons.car_crash),
      //     Icon(Icons.car_crash),
      //     Icon(Icons.car_crash),
      //     Icon(Icons.car_crash),
      //   ],
      // ),
      body: ListView(
        children: _buildList(),
      ),
      // body: CustomScrollView(
      //   slivers: [listView1, listView2],
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FlutterLogo(size: 20),
              label: 'Tab1',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: FlutterLogo(size: 20),
              label: 'Tab2',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: FlutterLogo(size: 20),
              label: 'Tab3',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: FlutterLogo(size: 20),
              label: 'Tab4',
              backgroundColor: Colors.blue),
        ],
        currentIndex: _index,
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
