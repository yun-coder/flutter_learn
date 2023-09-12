# 单子级 (Single child)

- Align——让子级在其内部进行对齐。可使用 -1 至 1 之间的任意值在垂直和水平方向上进行对齐。
- AspectRatio——尝试让子级以指定的比例进行布局。 纵横比
- ConstrainedBox——对子级施加尺寸限制，可以控制最小和最大的尺寸。
- CustomSingleChildLayout——使用代理方法对单个子级进行定位。代理方法可以为子级确定布局限制和定位。
- Expanded 和 Flexible——允许 Row 或 Column 的子级填充剩余空间或者尽可能地小。
- FractionallySizedBox——基于剩余空间的比例限定子级的大小。
- LayoutBuilder——让子级可以基于父级的尺寸重新调整其布局。
- SingleChildScrollView——为单一的子级添加滚动。通常配合 Row 或 Column 进行使用。

# 多子级 (Multi child)

- Column、Row 和 Flex—— 在同一水平线或垂直线上放置所有子级。 Column 和 Row 都继承了 Flex widget。
- CustomMultiChildLayout—— 在布局过程中使用代理方法对多个子级进行定位。
- Flow——相对于 CustomMultiChildLayout 更高效的布局方式。在绘制过程中使用代理方法对多个子级进行定位。
- ListView、GridView 和 CustomScrollView—— 为所有子级增加滚动支持。
- Stack——基于 Stack 的边界对多个子级进行放置和定位。与 CSS 中的 position: fixed 功能类似。
- Table——使用经典的表格布局算法，可以组合多列和多行。
- Wrap——将子级顺序显示在多行或多列内。

# Flutter 架构

- Platform embedding 平台嵌入
    - iOS和MacOs UIViewController和NSViewController载入到嵌入层，这些嵌入层会创建一个FlutterEngine
- 测试函数是否相等
- [⽅法也是对象可以⽤ == 判断是否相等] [同⼀对象的同⼀⽅法相等 不同对象的同⼀⽅法不相等]

# 知识点

- rootBundle.loadString('assets/config.json') 加载资源文件  'package:flutter/services.dart'
- EdgeInsets 边缘插入
- kIsWeb 一个常量，如果应用程序被编译为在Web上运行，则该常量为true。
- 在构建方法中使用 MediaQuery.of() 获取到当前应用 （基于上下文）的尺寸旋转方向等
- VisualDensity 类可以让你快速地调整整个应用的视图密度
- SafeArea 兼容ios和Android的页面区域，上下留白部分
- final GlobalKey _formKey = GlobalKey<FormState>(); 在整个应用程序中唯一的密钥。
- Constraints 布局约束 当一个 widget 告诉其子级可以比自身更小的话，我们通常称这个 widget 对其子级使用约束
    - 宽松约束（loose） 严格约束(Tight)
    - ConstrainedBox() 约束框 UnconstrainedBox() 无约束框

- SizedBox.expand()   如果想要 Scaffold 的子级变得和 Scaffold 本身一样大的话，你可以将这个子级外包裹一个
  SizedBox.expand。


- 绝对定位 Stack+Positioned
- 流式布局 Flex+Expanded(flex:1)
- softWrap 文本将在填充满列宽后在单词边界处自动换行
- LinearProgressIndicator()  水平进度条 CircularProgressIndicator()  圆形进度条
- OverflowBox()       OverflowBox 与 UnconstrainedBox
  类似，但不同的是，如果其子级超出该空间，它将不会显示任何警告~
- LimitedBox()
- FittedBox() 只能在有限制的宽高中对子 widget 进行缩放（宽度和高度不会变得无限大）
- Expanded 创建一个扩展[行]、[列]或[Flex]的子控件的小部件，以便子控件沿着Flex小部件的主轴
- Flexible 使用 Flexible 而不是 Expanded 的话，唯一的区别是，Flexible 会让其子级具有与
  Flexible相同或者更小的宽度。而 Expanded 将会强制其子级具有和 Expanded 相同的宽度
- SizedBox 创建一个固定尺寸的盒子
- Container 允许自定义的widget
- ListView
    - ListView scrollDirection: Axis.horizontal 横向滚动
    - ListView.separated 留有间隙的列表
- onGenerateRoute()   路由权限控制 MaterialPageRoute->builder 也可以生成目标页面
- EdgeInsets. 四个基本方向上的一组不可变的偏移量。
- Navigator.pushNamed()           路由跳转
- Image.asset()                   加载图片
- TextEditingController()         输入监听
- FocusNode()                     光标焦点
- TextSelection()                 文本选择范围
- BoxDecoration()                 盒子装饰
- InputDecoration()               输入框装饰 obscureText=true 用于输入密码的场景等，文本内容会用“•”替换
- Builder()                       一个无状态实用程序小部件，其构建方法使用其生成器回调来创建小部件的子部件
- Padding(); 内部间距
- Form() =>TextFormField()        表单校验
- Alignment 随意放置位置 需要显示的内容在左上角，左下角，右上角，右下角
- mainAxisAlignment x轴水平延伸 crossAxisAlignment y轴水平延伸
- CustomScrollView()   [<b>sliver</b>]自定义滚动列表 SliverAppBar()  SliverList()
- DefaultTabController()  TabBar()  TabBarView()  tab 切换
- PreferredSizeWidget 提前渲染
- JSON 加解密
    - jsonDecode
    - jsonEncode

# 手势检测器

- GestureDetector
    - 点击
        - onTapDown 指针在发生接触的屏幕的特定位置可能引发点击事件。
        - onTapUp 触发点击事件的触点已经在某个点停止与屏幕交互
        - onTap 触发 onTapDown 的触点此时已触发了 onTapUp，即产生了点击事件
        - onTapCancel 指针已经触发了 onTapDown，但是最终不会形成一个点击事件。
    - 双击
        - onDoubleTap 用户在屏幕的相同位置上快速点击了两次
    - 长按
        - onLongPress 指针在屏幕的相同位置上保持接触持续一长段时间
    - 纵向拖动
        - onVerticalDragStart 指针和屏幕产生接触并可能开始纵向移动
        - onVerticalDragUpdate 指针和屏幕产生接触，在纵向上发生移动并保持移动
        - onVerticalDragEnd 指针先前和屏幕产生了接触，以特定速度纵向移动，并且此后不会在屏幕接触上发生纵向移动
    - 横向拖动
        - onHorizontalDragStart 指针和屏幕产生接触并可能开始横向移动
        - onHorizontalDragUpdate 指针和屏幕产生接触，在横向上发生移动并保持移动
        - onHorizontalDragEnd 指针先前和屏幕产生了接触，以特定速度横向移动，并且以后不会在屏幕接触上发生横向移动
    - 移动
        - onPanStart 指针和屏幕产生接触并可能开始横向移动或者纵向移动。如果设置了
          onHorizontalDragStart 或者 onVerticalDragStart,该回调方法会引发崩溃。
        - onPanUpdate 指针和屏幕产生接触，在横向或者纵向上发生移动并保持移动。如果设置了
        - onHorizontalDragUpdate 或者 onVerticalDragUpdate 该回调方法会引发崩溃。
        - onPanEnd 指针先前和屏幕产生了接触并且以特定速度移动，此后不再在屏幕接触上发生移动，如果设置了
        - onHorizontalDragEnd 或者 onVerticalDragEnd 该回调方法会引发崩溃。

# 动画

- RepaintBoundary class
- AnimatedContainer 在使用新属性进行重建时，将会自动在旧值和新值之间生成动画。这种动画在 Flutter
  中被称为“隐式动画”
- AnimatedOpacity 一般会使用不透明动画让元素淡入淡出，以创建出更加流畅的用户体验
- Animation
    - AnimatedBuilder 希望将动画作为复杂 widgets 的 build 方法的其中一部分
    - AnimatedWidget 无状态动画 widgets
    - AnimationStatus addStatusListener 监视动画状态变化
    - AnimationController 正向播放 forward 或停止动画 stop 物理模拟效果 fling 弹簧效果
    - Animatables 抽象类将双精度值映射为特定类型的值
    - Tween 补间动画
    - vsync 帧同步
    - 调度器 SchedulerBinding 是一个暴露出 Flutter 调度原语的单例类
    - 运行器 Ticker
    - 模拟器 Simulation
    - 曲线 Curve
    - Interval 延迟动画
    - chain 添加连续动画
    - Hero 从原页面飞到目标页面的 widget
    - Inkwell 指定点击 hero 时发生什么。 InkWell 的 onTap() 方法可以创建新页面并推送至 Navigator 的堆栈。
    - Navigator Navigator 管理一个页面堆栈。推送或弹出 Navigator 堆栈中的页面触发动画。
    - Route 指定屏幕或页面。除最基本的应用程序外，大部分含有多页面
    - SingleTickerProviderStateMixin
    - TickerProviderStateMixin

# 状态管理

- ephemeral 短时（有时也称 用户界面 (UI) 状态 或者 局部状态）
- app 应用
- Provider
    - MultiProvider providers ChangeNotifierProxyProvider
    - notifyListeners
- InheritedWidget 通过把状态放到InheritedWidget中管理，子树所有节点可以方便的获取到状态而无需外部传入，通过ChangeNotifer
  更新状态，让 State 继承或者混入ChangeNotify
- InheritedWidget & InheritedModel
- flutter_reactive_value

# Package

- is:flutter-favorite 推荐包
- flutter pub add  [包名] 添加依赖到 dependencies
- flutter pub add dev:[包名] 添加依赖到 dev_dependencies
- flutter pub remove[包名]  移除一个依赖
- 解决依赖版本冲突
    - dependency_overrides '***' 声明指定依赖版本
    - 如果依赖冲突不是package自身而是特定于Android的库，那么依赖的覆盖声明必须添加到Gradle的构建逻辑中
        - configurations.all **




