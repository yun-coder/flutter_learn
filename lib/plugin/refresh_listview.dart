import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _RefreshListViewState();
}

class _RefreshListViewState extends State<MyApp> {
  final ScrollController _scrollController = ScrollController();
  bool _isRefreshing = false;
  List<String> _data = List.generate(20, (index) => 'Item $index');

  // 模拟数据刷新
  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _data = List.generate(20, (index) => 'Item $index');
      _isRefreshing = false;
    });
  }

  void _loadMoreData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      List.generate(10, (index) => _data.add('Item ${index + _data.length}'));
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          _refreshData();
        } else {
          _loadMoreData();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下拉加载更多，上拉刷新"),
        backgroundColor: Colors.blue,
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollNotification &&
              _scrollController.position.pixels >= 0) {
            // 列表向下滚动时，隐藏刷新控件
            _isRefreshing = false;
          } else if (notification is ScrollNotification &&
              _scrollController.position.pixels <= 0 &&
              !_isRefreshing) {
            _isRefreshing = true;
          }
          return true;
        },
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: _data.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(_data[index]),
                  )),
        ),
      ),
    );
  }
}
