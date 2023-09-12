import 'package:flutter/material.dart';

class CustomLongList extends StatelessWidget {
  final List<String> items = List.generate(1000, (index) => 'item $index');

  CustomLongList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("长列表"),
      ),
      body: _buildLongList(),
    );
  }

  Widget _buildLongList() {
    return ListView.builder(
        itemCount: items.length,
        prototypeItem: ListTile(title: Text(items.first)),
        itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]));
        });
  }
}
