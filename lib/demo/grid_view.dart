// todo GridView
import 'package:flutter/material.dart';

class SwitchTestState extends StatefulWidget {
  const SwitchTestState({super.key});

  @override
  State<StatefulWidget> createState() => _GridAndListView();
}

class _GridAndListView extends State<SwitchTestState> {
  bool _switchSelected = true;

  void _convertSelected() {
    setState(() {
      _switchSelected = !_switchSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("GridView"),
        ),
        body: Center(child: _switchSelected ? _buildGrid() : _buildList()),
        floatingActionButton: FloatingActionButton(
          onPressed: _convertSelected,
          tooltip: 'convert',
          child: const Icon(Icons.flip),
        ));
  }

  // todo  GridView
  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      // ignore: avoid_unnecessary_containers
      (index) => Container(child: Image.asset('images/list/pic$index.jpg')));

  // todo  ListView
  Widget _buildList() {
    return ListView(
      children: [
        _tile(
            "main title",
            "sub title test long text test long text test long text test long text test long text",
            Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        _tile("main title", "sub title", Icons.theaters),
        const Divider(),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
        _tile("main title", "sub title", Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subTitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      subtitle: Text(subTitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}
