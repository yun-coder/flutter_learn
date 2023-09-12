import 'package:flutter/material.dart';

class CustomDissItem extends StatefulWidget {
  const CustomDissItem({super.key});

  @override
  State<CustomDissItem> createState() => _DismissItem();
}

class _DismissItem extends State<CustomDissItem> {
  final items = List.generate(20, (index) => 'item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("滑动清除"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
                key: Key(item),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$item dismissed')));
                },
                child: ListTile(
                  title: Text(item),
                ));
          }),
    );
  }
}
