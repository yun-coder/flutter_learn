import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart' show debugPaintSizeEnabled; // 可视化调试引入
import 'package:my_app1/demo/dev.dart';
import 'package:my_app1/packageMgmt/demo.dart';
import 'package:my_app1/demo/base_component.dart';
import 'package:my_app1/demo/form.dart';
import 'package:my_app1/demo/form_valid.dart';
import 'package:my_app1/demo/progress.dart';
import 'package:my_app1/demo/layout.dart';
import 'package:my_app1/demo/grid_view.dart';
import 'package:my_app1/demo/card_stack.dart';
import 'package:my_app1/demo/constraints.dart';
import 'package:my_app1/demo/contents.dart';
import 'package:my_app1/demo/lateral_list.dart';
import 'package:my_app1/demo/different_kinds_list.dart';
import 'package:my_app1/demo/long_list.dart';
import 'package:my_app1/demo/scrollview.dart';
import 'package:my_app1/demo/parallax.dart';
import 'package:my_app1/demo/media_query.dart';
import 'package:my_app1/demo/drawer.dart';
import 'package:my_app1/demo/tabs.dart';
import 'package:my_app1/demo/scroll_bar.dart';

void main() {
  runApp(const MyApp());
  // todo 可视化调试
  debugPaintSizeEnabled = false;
  // todo Flutter 框架异常捕获
  // FlutterError.onError = (FlutterErrorDetails details) {
  //   print(details);
  // };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // static double densityAmt = 0.0;
  // final VisualDensity density =
  //     VisualDensity(horizontal: densityAmt, vertical: densityAmt);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        // visualDensity: density
      ),
      // todo 注册路由表
      routes: {
        // todo 注册首页路由
        "/": (context) => const MyHomePage(title: "Flutter Demo Home Page"),
        "new_page": (context) => const NewRoute(),
        "param_page": (context) => const ParamRoute(),
        "tip": (context) {
          return const TipRoute(text: "路由参数");
        },
        "base_page": (context) => const BaseDemo(),
        "package_demo": (context) => const RandomWordsWidget(),
        "form_page": (context) => const CustomForm(),
        "form_valid": (context) => const CustomValid(),
        "progress_page": (context) => const CustomProgress(),
        "layout_page": (context) => const CustomLayout(),
        "grid_page": (context) => const SwitchTestState(),
        "card_stack": (context) => const CustomStackAndCard(),
        "Constraint_demo": (context) => const CustomConstraints(),
        "Contents_demo": (context) => const CustomContents(),
        "list_demo": (context) => const CustomList(),
        "different_list": (context) => CustomTypeList(),
        "long_list": (context) => CustomLongList(),
        "scrollview": (context) => const TestScrollView(),
        "parallax_demo": (context) => const CustomParallax(),
        "query_demo": (context) => const FormFactor(),
        "drawer_demo": (context) => const CustomDrawerBox(),
        "tabs_demo": (context) => const CustomTabs(),
        "test_scrollBar":(context)=>const TestScrollBar()
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // todo 权限控制 onGenerateRoute
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String? routeName = settings.name;
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其他情况则正常打开路由。
      //   });
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  void _incrementCounter() {
    // setState(() {
    //   _counter++;
    // });
  }

  @override
  Widget build(BuildContext context) {
    // todo 页面脚手架 提供了默认的导航栏、标题和包含主屏幕 widget 树（后同“组件树”或“部件树”）的body属性 路由默认都是通过Scaffold创建
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: <Widget>[
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          // TextButton(
          //   // todo 测试路由
          //   child: const Text("open new route with param"),
          //   onPressed: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     //   return RouterTestRoute();
          //     //   // return NewRoute();
          //     // }));
          //     // Navigator.pushNamed(context, "new_page");
          //     Navigator.of(context)
          //         .pushNamed("param_page", arguments: "hehe");
          //   },
          // ),
          // 精确的细节会根据框架的版本、设备的大小等等而变化
          // TextButton(
          //     onPressed: (){
          //       // todo  Widget 树
          //       // debugDumpApp();
          //       // todo 渲染树
          //       // debugDumpRenderTree();
          //       // todo Layer树
          //       // debugDumpLayerTree();
          //     },
          //     child: const Text('dump app')
          // ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("基础组件"),
                onPressed: () {
                  Navigator.pushNamed(context, "base_page");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("包管理"),
                onPressed: () {
                  Navigator.pushNamed(context, "package_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("表单"),
                onPressed: () {
                  Navigator.pushNamed(context, "form_page");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("表单校验"),
                onPressed: () {
                  Navigator.pushNamed(context, "form_valid");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("进度条"),
                onPressed: () {
                  Navigator.pushNamed(context, "progress_page");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("布局"),
                onPressed: () {
                  Navigator.pushNamed(context, "layout_page");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "grid_page");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("堆叠和卡片"),
                onPressed: () {
                  Navigator.pushNamed(context, "card_stack");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("布局和限制"),
                onPressed: () {
                  Navigator.pushNamed(context, "Constraint_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("布局和构建"),
                onPressed: () {
                  Navigator.pushNamed(context, "Contents_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("列表(不同方向的实现)"),
                onPressed: () {
                  Navigator.pushNamed(context, "list_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("不同类型的列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "different_list");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("长列表"),
                onPressed: () {
                  Navigator.pushNamed(context, "long_list");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("浮动列表和AppBar"),
                onPressed: () {
                  Navigator.pushNamed(context, "scrollview");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("滚动视差"),
                onPressed: () {
                  Navigator.pushNamed(context, "parallax_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("媒体查询"),
                onPressed: () {
                  Navigator.pushNamed(context, "query_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("Drawer 抽屉"),
                onPressed: () {
                  Navigator.pushNamed(context, "drawer_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("Tabs"),
                onPressed: () {
                  Navigator.pushNamed(context, "tabs_demo");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("scroll bar"),
                onPressed: () {
                  Navigator.pushNamed(context, "test_scrollBar");
                },
              )),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ElevatedButton(
                child: const Text("show SnackBar"),
                onPressed: () {
                  final snackBar = SnackBar(
                      content: const Text("this is a SnackBar"),
                      action: SnackBarAction(label: 'Undo', onPressed: () {}));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
