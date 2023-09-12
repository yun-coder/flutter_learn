// JSON serialize 序列化
// 使用 dart:convert 手动序列化 JSON 数据
// built_value: ^8.6.2
// json_serializable: ^6.7.1
// json_serializable package 能够通过注解让你的普通类序列化，
// 而 built_value package 则提供了更高层次的方法，让定义为无变化的类也能够被序列化为 JSON。

import 'dart:convert';

import 'package:flutter/material.dart';
import 'user.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('json serialize'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Text(jsonEncode(User.fromJson(userMap))),
    );
  }
}

final jsonString = jsonEncode(<String, dynamic>{
  'name': 'jack li',
  'email': '123@qq.com',
});
Map<String, dynamic> userMap = jsonDecode(jsonString);

// 添加对象类可以拥有类型安全，name 和 email 的自动完成以及编译时异常检测
// class User {
//   final String name;
//   final String email;
//
//   User(this.name, this.email);
//
//   User.fromJson(Map<String, dynamic> json)
//       : name = json['name'],
//         email = json['email'];
//
//   Map<String, dynamic> toJson() => {'name': name, 'email': email};
// }

void main() {
  runApp(const MaterialApp(
    title: 'json序列化',
    home: MyApp(),
  ));
}
