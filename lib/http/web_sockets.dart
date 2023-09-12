// 连接 WebSocket 服务器
// 监听来自服务器的消息
// 向服务器发送数据
// 关闭 WebSocket 连接

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'websocket demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final _channel =
      WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  @override
  void dispose() {
    _controller.dispose();
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('websocket demo'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                child: TextFormField(
              decoration: const InputDecoration(labelText: 'send message'),
              controller: _controller,
            )),
            const SizedBox(
              height: 24,
            ),
            StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  return Text(snapshot.hasData
                      ? '${snapshot.data}'
                      : '');
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'send message',
        child: const Icon(Icons.send),
        onPressed: (){
          if(_controller.text.isNotEmpty){
            _channel.sink.add(_controller.text);
          }
        },
      ),
    );
  }
}
