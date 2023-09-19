// todo 通过其源码我们可以看到，只要 newWidget 与 oldWidget 的 runtimeType 和 key同时相等时就会用new widget去更新Element对象的配置，否则就会创建新的Element
// todo 在 Flutter 开发中，我们一般都不用直接继承Widget类来实现一个新组件通常会通过继承 StatelessWidget 或 StatefulWidget 来间接继承widget类来实现

// todo 四棵树
// 1、Widget 树                                                                Widget
// 2、根据 Widget 树生成一个 Element 树  Element 树中的节点都继承自 Element 类       Element
// 3、根据 Element 树生成 Render 树（渲染树） 渲染树中的节点都继承自RenderObject 类    Render
// 4、根据渲染树生成 Layer 树，然后上屏显示，Layer 树中的节点都继承自 Layer 类          Layer
// todo  Widget 树
// debugDumpApp();
// todo 渲染树
// debugDumpRenderTree();
// todo Layer树
// debugDumpLayerTree();
// todo 调度
// 可以切换 debugPrintBeginFrameBanner (opens new window) 和 debugPrintEndFrameBanner

// todo StatelessWidget
// 用于不需要维护状态的场景，它通常在build方法中通过嵌套其他 widget 来构建UI，在构建过程中会递归的构建其嵌套的 widget
// todo StatelessWidget
// StatefulWidget也是继承自widget类，并重写了createElement()方法，不同的是返回的Element 对象并不相同；另外StatefulWidget类中添加了一个新的接口createState()。

// todo build
// build 方法有一个context参数，它是BuildContext类的一个实例，
// 表示当前 widget 在 widget 树中的上下文，每一个 widget 都会对应一个 context 对象
// （因为每一个 widget 都是 widget 树上的一个节点）。
// 实际上，context是当前 widget 在 widget 树中位置中执行”相关操作“的一个句柄(handle)

// todo State
// 一个 StatefulWidget 类会对应一个 State 类
// 在 widget 构建时可以被同步读取
// 在 widget 生命周期中可以被改变，当State被改变时，可以手动调用其setState()方法通知Flutter 框架状态发生改变，
// Flutter 框架在收到消息后，会重新调用其build方法重新构建 widget 树，从而达到更新UI的目的
// State 中的两个常用属性 widget context
// todo State 状态管理规则
// 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父 Widget 管理。
// 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由 Widget 本身来管理。
// 如果某一个状态是不同 Widget 共享的则最好由它们共同的父 Widget 管理。

// todo 基础组件 --基本用不到下面2个都已经包含了
// import 'package:flutter/widgets.dart';
// todo Material组件
// import 'package:flutter/material.dart';
// todo Cupertino组件
// import 'package:flutter/cupertino.dart';

// todo MaterialPageRoute extends  PageRoute
// MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。
// MaterialPageRoute 是 Material组件库提供的组件，它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画
// MaterialPageRoute({
// WidgetBuilder builder,  返回新路由的实例
// RouteSettings settings, 包含路由的配置信息
// bool maintainState = true, 默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为 false
// bool fullscreenDialog = false, 新的路由页面是否是一个全屏的模态对话框，在 iOS 中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）
// })

// todo Navigator
// Navigator是一个路由管理的组件，它提供了打开和退出路由页方法。Navigator通过一个栈来管理活动路由集合。通常当前屏幕显示的页面就是栈顶的路由。
// todo Future push(BuildContext context, Route route)
// 将给定的路由入栈（即打开新的页面），返回值是一个Future对象，用以接收新路由出栈（即关闭）时的返回数据
// todo bool pop(BuildContext context, [ result ])
// 将栈顶路由出栈，result 为页面关闭时返回给上一个页面的数据

// todo 命名路由 Named Route
// 所谓“命名路由”（Named Route）即有名字的路由，我们可以先给路由起一个名字，然后就可以通过路由名字直接打开新的路由了，这为路由管理带来了一种直观、简单的方式
// 路由表 routing table
// Map<String WidgetBuilder> routes

// todo 通过路由名打开新路由页
// Future pushNamed(BuildContext context, String routeName,{Object arguments})

// todo 路由生成钩子  onGenerateRoute
// 有了onGenerateRoute回调，要实现控制页面权限的功能就非常容易
// MaterialApp有一个onGenerateRoute属性，它在打开命名路由时可能会被调用，之所以说可能，是因为当调用Navigator.pushNamed(...)打开命名路由时，
// 如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由
// Route<dynamic> Function(RouteSettings settings)
// todo MaterialApp.navigatorObservers  可以监听所有路由跳转动作
// todo MaterialApp.onUnknownRoute 打开一个不存在的命名路由时会被调用

// todo 日志与断点  import 'dart:developer';  debugger(when ...) print() debugPrint(内容过多时会分批输出) flutter logs
// todo 调试性能问题 debugPrintStack()
// todo debugPrintMarkNeedsLayoutStacks (opens new window)和 debugPrintMarkNeedsPaintStacks每当渲染盒被要求重新布局和重新绘制时，这些都会将堆栈跟踪记录到控制台。
// todo 统计应用启动时间  flutter run --trace-startup --profile

// todo dart 单线程模型  可以通过Future.microtask(…)方法向微任务队列插入一个任务。

// todo 其他异常捕获与日志收集
// Dart中有一个runZoned(...) 方法，可以给执行对象指定一个Zone。Zone表示一个代码执行的环境范围，
// 可以将Zone类比为一个代码执行沙箱，不同沙箱的之间是隔离的，沙箱可以捕获、拦截或修改一些代码行为
// ，如Zone中可以捕获日志输出、Timer创建、微任务调度的行为，同时Zone也可以捕获所有未处理的异常。

// todo 加载 assets 静态资源文件   AssetBundle
// 加载文本 assets  通过 rootBundle 全局静态的对象
// 通过 DefaultAssetBundle.of() 在应用运行时来间接加载（例如json文件），而在Widget 上下文之外或其他 AssetBundle 句柄不可用时可以使用 rootBundle 直接加载 assets
// todo 加载图片 AssetImage
// AssetImage (opens new window)可以将asset的请求逻辑映射到最接近当前设备像素比例（dpi）的asset。为了使这种映射起作用，必须根据特定的目录结构来保存asset：
// …/Mx/image.png
// …/Nx/image.png
// …/2.0x/my_icon.png
// …/3.0x/my_icon.png
// pubspec.yaml中asset部分中的每一项都应与实际文件相对应，但主资源项除外。
// 当主资源缺少某个资源时，会按分辨率从低到高的顺序去选择 ，也就是说1x中没有的话会在2x中找，2x中还没有的话就在3x中找。
// todo 依赖包中的资源图片
// 要加载依赖包中的图像，必须给AssetImage提供package参数。
// …/pubspec.yaml
// …/icons/heart.png
// …/icons/1.5x/heart.png
// …/icons/2.0x/heart.png
// todo  AssetImage('icons/heart.png', package: 'my_icons')  或者 Image.asset('icons/heart.png', package: 'my_icons')
// todo 加载文本 assets

// todo 特定平台 assets 设置APP图标
// Android  /android/app/src/main/res
// IOS      /ios/Runner/Assets.xcassets/AppIcon.appiconset/
// 设置启动页
// Android  /android/app/src/main/res/drawable/launch_background.xml
// IOS      /ios/Runner/Assets.xcassets/LaunchImage.imageset/     替换图片和JSON 文件

import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

// todo 跳转路由
class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NEW ROUTE"),
      ),
      body: const Center(
        child: Text("this is new route"),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({
    super.key,
    required this.text, // 接收一个text参数
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, "我是返回值"),
                  child: const Text("返回"))
            ],
          ),
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          // var res = await Navigator.push(context,
          //     MaterialPageRoute(builder: (context) {
          //   return const TipRoute(text: "我是提示");
          // }));
          // print("路由返回值 ${res}");
        },
        child: const Text("打开提示页"),
      ),
    );
  }
}

// todo 路由传参
class ParamRoute extends StatelessWidget {
  const ParamRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)?.settings.arguments;
    // print(args);
    return const Center(
      child: Text("获取路由参数"),
    );
  }
}

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/json/config.json');
}
