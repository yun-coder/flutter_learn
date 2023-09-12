// todo card stack
import 'package:flutter/material.dart';

class CustomStackAndCard extends StatefulWidget {
  const CustomStackAndCard({super.key});

  @override
  State<StatefulWidget> createState() => _StackAndCard();
}

class _StackAndCard extends State<CustomStackAndCard> {
  bool _showCard = true;

  void _convertSelected() {
    setState(() {
      _showCard = !_showCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("card 和 stack"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(child: _showCard ? _buildCard() : _buildStack()),
        floatingActionButton: FloatingActionButton(
          onPressed: _convertSelected,
          tooltip: 'convert',
          child: const Icon(Icons.flip),
        ));
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text("main title",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: const Text("sub title"),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[200],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("main title",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[200],
              ),
            ),
            ListTile(
              title: const Text("main title",
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[200],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.1, 0.1),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("images/list/pic0.jpg"),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: const Text('THIS IS YOUR WIFE',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )
      ],
    );
  }
}
