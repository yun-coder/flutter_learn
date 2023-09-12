import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          ElevatedButton(onPressed: timePicker, child: const Text('选择时间'))
        ],
      ),
    );
  }
}
