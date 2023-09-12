import 'package:flutter/material.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("tabs demo"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
          ),
          body: const TabBarView(children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ]),
        ));
  }
}
