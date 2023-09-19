import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  int _radioSelectedIndex = 0;
  double _sliderValue = 0.0;
  String _selectOption = 'option1';
  String _remark = "";
  late DateTime _selectNowDate = DateTime.now();
  late TimeOfDay _selectNowTime = TimeOfDay.now();
  final List<String> _options = ['option1', 'option2', 'option3', 'option4'];
  late AnimationController _controller;
  bool _clipSelect = false; // 是否选中
  bool _ignore = true; //忽视点击

  // 日期选择器
  Future<void> datePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectNowDate,
      firstDate: DateTime(1997),
      lastDate: DateTime(2100),
      initialDatePickerMode: DatePickerMode.day,
    );
    if (picked != null && picked != _selectNowDate) {
      setState(() {
        _selectNowDate = picked;
      });
    }
  }

  void timePicker() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectNowTime,
    );
    if (picked != null && picked != _selectNowTime) {
      setState(() {
        _selectNowTime = picked;
      });
    }
  }

  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(date);
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // Radio
  Widget _buildRadioList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
                value: 0,
                groupValue: _radioSelectedIndex,
                onChanged: (int? value) {
                  setState(() {
                    _radioSelectedIndex = value!;
                  });
                }),
            const Text('选项1'),
            Radio(
                value: 1,
                groupValue: _radioSelectedIndex,
                onChanged: (int? value) {
                  setState(() {
                    _radioSelectedIndex = value!;
                  });
                }),
            const Text('选项二'),
          ],
        )
      ],
    );
  }

  // 进度条
  Widget _buildProgressIndicator() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_controller),
              value: _controller.value,
            ),
          ),
        ],
      ),
    );
  }

  Widget yellowBox = Container(
    color: Colors.yellow,
    height: 100,
    width: 100,
  );
  Widget redBox = Container(
    color: Colors.red,
    height: 90,
    width: 90,
  );
  Widget greenBox = Container(
    color: Colors.green,
    height: 80,
    width: 80,
  );
  Widget cyanBox = Container(
    color: Colors.cyanAccent,
    height: 70,
    width: 70,
  );

  final List<String> flowData = List.generate(16,
      (index) => index.isEven ? 'images/beachBall.png' : 'images/chair.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('小组件集合'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Icon(Icons.add),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'images/beachBall.png',
              width: 20,
            ),
          ),
          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
          const SizedBox(height: 10),
          Checkbox(
              tristate: false, // 为true多了一个null的状态
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  // print(value);
                  _checkboxSelected = value!; // 有可能是null
                });
              }),
          _buildRadioList(),
          const SizedBox(height: 10),
          _buildProgressIndicator(),
          const SizedBox(height: 10),
          Slider(
              value: _sliderValue,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              }),
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              width: 80,
              child: DropdownButton(
                  value: _selectOption,
                  items: _options.map((String e) {
                    return DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      _selectOption = newVal!;
                    });
                  }),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              hintText: 'enter description',
              labelText: 'desc',
            ),
            maxLines: 5,
            onChanged: (value) {
              setState(() {
                _remark = value;
              });
            },
          ),
          SizedBox(
            height: 20,
            child: Text(_formatDate(_selectNowDate)),
          ),
          ElevatedButton(onPressed: datePicker, child: const Text("选择日期")),
          SizedBox(
            height: 20,
            child: Text(_selectNowTime.format(context)),
          ),
          ElevatedButton(onPressed: timePicker, child: const Text('选择时间')),
          const SizedBox(
            height: 20,
          ),
          InputChip(
            selected: _clipSelect,
            padding: const EdgeInsets.all(5),
            labelPadding: const EdgeInsets.all(3),
            backgroundColor: Colors.grey.withAlpha(66),
            avatar: Image.asset("images/beachBall.png"),
            label: const Text("this is a InputChip"),
            selectedColor: Colors.orangeAccent.withAlpha(88),
            selectedShadowColor: Colors.blue,
            shadowColor: Colors.orangeAccent,
            elevation: 3,
            onSelected: (bool value) {
              setState(() {
                _clipSelect = value;
              });
            },
            onDeleted: () => Navigator.of(context).pop(),
          ),
          const SizedBox(height: 20),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              const Text("IgnorePointer:忽视点击"),
              const Text("AbsorbPointer:吸收点击"),
              GestureDetector(
                onTap: () {},
                child: IgnorePointer(
                  ignoring: _ignore,
                  child: ElevatedButton(
                    child: const Text("is ignore?"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('去除了忽视点击')));
                    },
                  ),
                ),
              ),
              Switch(
                  value: _ignore,
                  onChanged: (v) {
                    setState(() {
                      _ignore = v;
                    });
                  })
            ],
          ),
          const SizedBox(
            height: 30,
          ), //堆叠布局
          Container(
            width: 200,
            height: 120,
            color: Colors.grey.withAlpha(33),
            child: Stack(
              textDirection: Directionality.of(context),
              fit: StackFit.loose,
              alignment: Alignment.topLeft,
              children: [yellowBox, redBox, greenBox, cyanBox],
            ),
          ),
          Container(
            width: 200,
            height: 120,
            color: Colors.grey.withAlpha(33),
            child: Stack(
              textDirection: Directionality.of(context),
              fit: StackFit.loose,
              alignment: Alignment.topLeft,
              children: [
                yellowBox,
                redBox,
                greenBox,
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: cyanBox,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: Flow(
              delegate: _CircleFlowDelegate(),
              children: flowData
                  .map((e) => CircleAvatar(
                        backgroundImage: AssetImage(e),
                      ))
                  .toList(),
            ),
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: BurstFlow.show,
          ),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

class _CircleFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    final double radius = context.size.shortestSide / 2;
    final int count = context.childCount;
    final double perRad = 2 * math.pi / count;
    for (int i = 0; i < count; i++) {
      final Size size = context.getChildSize(i) ?? Size.zero;
      final double offsetX =
          (radius - size.width / 2) * math.cos(i * perRad) + radius;
      final double offsetY =
          (radius - size.height / 2) * math.sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - size.width / 2, offsetY - size.height / 2, 0.0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) => false;
}

class BurstFlow extends StatefulWidget {
  static final List<String> flowData = List.generate(16,
          (index) => index.isEven ? 'images/beachBall.png' : 'images/chair.png');

  static final show = Container(
      width: 300,
      height: 300,
      alignment: Alignment.center,
      child: BurstFlow(
          menu: const CircleAvatar(
            backgroundImage: AssetImage('images/binoculars.png'),
          ),
          children: flowData
              .map((e) => CircleAvatar(backgroundImage: AssetImage(e)))
              .toList()));

  final List<Widget> children;
  final Widget menu;

  const BurstFlow({Key? key, required this.children, required this.menu})
      : super(key: key);

  @override
  State<BurstFlow> createState() => _BurstFlowState();
}

class _BurstFlowState extends State<BurstFlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _rad = 0.0;
  bool _closed = true;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..addListener(() => setState(
          () => _rad = (_closed ? (_controller.value) : 1 - _controller.value)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _closed = !_closed;
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: _BurstFlowDelegate(_rad),
      children: [
        ...widget.children,
        InkWell(
            onTap: () {
              _controller.reset();
              _controller.forward();
            },
            child: widget.menu)
      ],
    );
  }
}

class _BurstFlowDelegate extends FlowDelegate {
  final double rad;

  _BurstFlowDelegate(this.rad);

  @override //绘制孩子的方法
  void paintChildren(FlowPaintingContext context) {
    double radius = context.size.shortestSide / 2;
    final int count = context.childCount - 1;
    final double perRad = 2 * math.pi / count;
    for (int i = 0; i < count; i++) {
      Size size = context.getChildSize(i) ?? Size.zero;
      final double offsetX =
          rad * (radius - size.width / 2) * math.cos(i * perRad) + radius;
      final double offsetY =
          rad * (radius - size.height / 2) * math.sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - size.width / 2, offsetY - size.height / 2, 0.0));
    }

    Size size = context.getChildSize(context.childCount - 1) ?? Size.zero;

    context.paintChild(context.childCount - 1,
        transform: Matrix4.translationValues(
            radius - size.width / 2, radius - size.height / 2, 0.0));
  }

  @override
  bool shouldRepaint(_BurstFlowDelegate oldDelegate) => oldDelegate.rad != rad;
}
