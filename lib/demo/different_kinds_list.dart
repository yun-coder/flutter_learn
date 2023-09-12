// 运用抽象类实例化的方法加载不同的结构


import 'package:flutter/material.dart';

class CustomTypeList extends StatelessWidget {
  CustomTypeList({super.key});

  final List<ListItem> items = List.generate(
    50,
    (i) => i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message body $i'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("不同类型的列表"),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubTitle(context),
          );
        });
  }
}

// todo 定义抽象
abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubTitle(BuildContext context);
}

// todo 实现头部列表
class HeadingItem implements ListItem {
  final String heading;
  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(heading, style: Theme.of(context).textTheme.headlineSmall);
  }

  @override
  Widget buildSubTitle(BuildContext context) => const SizedBox.shrink();
}

// todo 实现消息列表
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubTitle(BuildContext context) => Text(body);
}
