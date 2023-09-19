# Flutter API整理

- Isolate 隔离区运行
    - FutureBuilder
    - StreamBuilder

- 按钮
    - TextButton
    - ElevatedButton
    - OutlinedButton
    - FilledButton
    - 继承不同
    - FloatingActionButton
    - IconButton

- 布局组件
    - CustomSingleChildLayout
        - ConstrainedBox 约束子组件大小
        - UnconstrainedBox 让⼦组件不再受⽗组件⼤⼩约束，可以⾃由绘制超出边界会报错
        - OverflowBox 超出边界不会报错
        - SizedBox
        - FittedBox 动态适配⽗组件⼤⼩。⾸先按照不约束进⾏⼦组件布局，获取⼦组件⾃⾝⼤⼩后根据指定的适配⽅式决定缩放
          还是裁剪⼦组件
        - Flex
            - Row
            - Column
        - Align
            - Center
        - Padding
        - FractionalTranslation
        - ConstraintsTransformBox
        - LimitedBox
        - AspectRatio
    - CustomMultiChildLayout
        - Stack 堆叠布局
        - [Flow  流动布局  布局王者]
        - Container
        - LayoutBuilder
        - wrap 包裹布局，子组件按照指定方向依次排布，越界时可以自动换行。
    - Flexible 按⽐例分配主轴⽅向空间
        - Expanded
    - Text
        - Text.rich TextSpan
    - DefaultTextStyle
    - Card
    - ListTile
    - CircleAvatar 圆形头像
    - PreferredSizeWidget 预先渲染
    - Dismissible 列表删除
    - SafeArea ios 空白区域兼容
    - Visibility 隐藏或显示一个子节点

- 装饰组件
    - DecoratedBox 背景，边框，渐变 BoxDecoration
    - Transform 平移，旋转，缩放
    - RotatedBox RotatedBox是在布局阶段旋转，因此会改变控件的⼤⼩和位置。
    - ClipOval 将矩形裁剪为内贴椭圆
    - ClipRRect 裁剪为圆角矩形
    - ClipRect 裁剪溢出部分
    - ClipPath 用于复杂裁剪

- 滚动组件
    - SingleChildScrollView 单组件可滚动
    - ListView 滚动列表
        - ListView.separated 分开的列表
    - GridView 滚动表格
    - PageView tab页 横向滚动页   (TabBar+TabBarView)横向分页切换
    - CustomScrollView 合并多个滚动组件 共⽤ Scrollable 和 Viewport 对象，将多个滚动组件对应的 Sliver
      添加到这个共⽤的Viewport 对象中
        - SliverAppBar
        - SliverList

- 通知弹窗
    - SnackBar
    - showDialog
    - AlertDialog
    - SimpleDialog
    - Dialog


- 手势识别
    - GestureDetector
        - onTap 点击
        - onDoubleTap 双击
        - onLongPress 长按
        - 滑动 onPanDown onPanUpdate onPanEnd

- 效果
    - InkWell 水波效果
    - Draggable 拖动效果 DragTarget

- 路由
    - PageRoute
        - PageRouteBuilder


- 组件
    - showDatePicker
    - showTimePicker