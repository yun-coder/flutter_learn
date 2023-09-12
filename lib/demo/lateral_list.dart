// 横向滚动列表

import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("列表"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: _buildHorizontal(),
      ),
    );
  }

  Widget _buildHorizontal() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        Container(
          width: 160,
          color: Colors.red,
        ),
        Container(
          width: 160,
          color: Colors.blue,
        ),
        Container(
          width: 160,
          color: Colors.green,
        ),
        Container(
          width: 160,
          color: Colors.grey,
        ),
      ],
    );
  }
}
