import 'package:flutter/material.dart';

class TestScrollView extends StatelessWidget {
  const TestScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: const Text("Floating Bar"),
          floating: true,
          flexibleSpace: Image.asset("images/lake.jpg"),
          expandedHeight: 200,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.blue[200],
          ),
          automaticallyImplyLeading: false,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(title: Text("item $index")),
                childCount: 100))
      ]),
    );
  }
}
