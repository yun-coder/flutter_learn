import 'package:flutter/material.dart';

class CustomDrawerBox extends StatefulWidget {
  const CustomDrawerBox({super.key});

  @override
  State<StatefulWidget> createState() => _DrawerBox();
}
// todo Drawer 抽屉
class _DrawerBox extends State<CustomDrawerBox> {
  int _selectedIndex = 0;

  static TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    Text('Index 0:Home', style: optionStyle),
    Text('Index 1:Business', style: optionStyle),
    Text('Index 2:School', style: optionStyle),
  ];

  void _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("drawer 抽屉"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Drawer Head')),
            ListTile(
              title: const Text("Home"),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTaped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Business"),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTaped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("School"),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTaped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
