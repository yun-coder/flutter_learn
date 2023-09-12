// HTTP 请求数据
// snapshot 快照
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Album>? _futureAlbum;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http demo'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(18),
        child: _buildColumn(), // _buildFutureBuilder(),
      ),
    );
  }

  Column _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(hintText: 'enter title'),
          controller: _controller,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _futureAlbum = createAlbum(_controller.text);
              });
            },
            child: const Text('create data'))
      ],
    );
  }

  FutureBuilder<Album> _buildFutureBuilder() {
    return FutureBuilder<Album>(
        future: _futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.hasError}');
          }
          return const CircularProgressIndicator();
        });
  }
}



class Album {
  final int id;
  final int userId;
  final String title;

  Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(id: json['id'], userId: json['userId'], title: json['title']);
  }
}
// http.get
// http.update
// http.delete
Future<Album> fetchAlbum() async {
  // headers 里面添加请求header 头部验证
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: {HttpHeaders.authorizationHeader: 'token here'});
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('请求失败！');
  }
}

// 发送数据给服务端
Future<Album> createAlbum(String title) async {
  final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: jsonEncode(<String, String>{'title': title}));
  if (response.statusCode == 201) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("请求失败！");
  }
}
