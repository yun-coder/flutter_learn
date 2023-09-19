import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String> loadArea() async {
    return await rootBundle.loadString('json/china_area.json');
  }

  Map<String, dynamic> jsonData = {};

  /// 省
  Map<String, dynamic> provinceMap = {};

  /// 市
  Map<String, dynamic> cityMap = {};

  /// 区
  Map<String, dynamic> townMap = {};
  List<MapEntry<String, dynamic>> provinceList = [];
  List<MapEntry<String, dynamic>> cityList = [];
  List<MapEntry<String, dynamic>> townList = [];

  int initProvinceIndex = 0;
  int initCityIndex = 0;
  int initCountyIndex = 0;

  Widget _builderPicker() {
    loadArea().then((value) {
      jsonData = jsonDecode(value);
      provinceMap = jsonData['86'];
      cityMap = jsonData[provinceMap.keys.first];
      townMap = jsonData[cityMap.keys.first];
      provinceList = provinceMap.entries.toList();
      if (initProvinceIndex == 0 &&
          initCityIndex == 0 &&
          initCountyIndex == 0) {
        cityList = cityMap.entries.toList();
        townList = townMap.entries.toList();
      }
    });
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              itemExtent: 40.0,
              onSelectedItemChanged: (position) {
                setState(() {
                  initProvinceIndex = position;
                  cityMap =
                      jsonData[provinceMap.entries.toList()[position].key];
                  cityList = cityMap.entries.toList();
                });
              },
              children: List<Widget>.generate(
                  provinceList.length,
                  (index) => Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          provinceList[index].value,
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      )),
            ),
          ),
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              itemExtent: 40.0,
              onSelectedItemChanged: (position) {
                setState(() {
                  initCityIndex = position;
                  townMap = jsonData[cityList[position].key];
                  townList = townMap.entries.toList();
                });
              },
              children: List<Widget>.generate(
                  cityList.length,
                  (index) => Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          cityList[index].value,
                          // cityList.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      )),
            ),
          ),
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              itemExtent: 40.0,
              onSelectedItemChanged: (position) {
                setState(() {
                  initCountyIndex = position;
                });
              },
              children: List<Widget>.generate(
                  townList.length,
                  (index) => Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          townList[index].value,
                          style: const TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w500),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  void showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))),
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('取消'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          '确认',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ]));
        });
  }

  Future<Future<int?>> _showCustomModalBottomSheet(context, List<String> options) async {
    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height / 2.0,
          child: Column(children: [
            SizedBox(
              height: 50,
              child: Stack(
                textDirection: TextDirection.rtl,
                children: [
                  const Center(
                    child: Text(
                      '底部弹窗',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            const Divider(height: 1.0),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(options[index]),
                      onTap: () {
                        Navigator.of(context).pop(index);
                      });
                },
                itemCount: options.length,
              ),
            ),
          ]),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('城市三级联动效果'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
        children: [
          // _builderPicker(),
          ElevatedButton(
            onPressed: () {
              showPicker(context);
            },
            child: const Text('城市选择'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _showCustomModalBottomSheet(context,[
                "test",
                "test",
                "test",
                "test",
              ]);
            },
            child: const Text("底部弹窗"),
          ),
        ],
      )),
    );
  }
}
