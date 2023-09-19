import 'package:flutter/material.dart';

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
  int _position = 0;

  final Map<String, String> stepsData = {
    "step1": "吃饭",
    "step2": "睡觉",
    "step3": "敲代码",
  };

  final List<Step> steps = const [
    Step(title: Text("吃饭"), content: Text("要吃饭")),
    Step(title: Text("睡觉"), content: Text("要睡觉")),
    Step(title: Text("敲代码"), content: Text("要干活")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("步骤条组件"),
      ),
      body: SizedBox(
        height: 700,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _position,
          onStepTapped: (index) {
            setState(() {
              _position = index;
            });
          },
          onStepContinue: () {
            setState(() {
              if (_position < 2) {
                _position++;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_position > 0) {
                _position--;
              }
            });
          },
          steps: stepsData.keys.map((e) {
            bool isActive = stepsData.keys.toList().indexOf(e) == _position;
            return Step(
                title: Text(
                  e,
                  style:
                      TextStyle(color: isActive ? Colors.blue : Colors.black),
                ),
                isActive: isActive,
                state: _getState(stepsData.keys.toList().indexOf(e)),
                content: SizedBox(
                  height: 60,
                  child: Text(stepsData[e]!),
                ));
          }).toList(),
          controlsBuilder: (BuildContext context,ControlsDetails details){
            return Row(
              children: <Widget>[
                ElevatedButton(style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const CircleBorder(
                    side: BorderSide(
                      width: 2.0,
                      color: Color(0xFFDFDFDF)
                    )
                  )
                ),
                    onPressed: details.onStepContinue,
                    child: const Icon(Icons.check,color: Colors.white,)),
                ElevatedButton(style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const CircleBorder(
                        side: BorderSide(
                            width: 2.0,
                            color: Color(0xFFDFDFDF)
                        )
                    )
                ),
                    onPressed: details.onStepCancel,
                    child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
              ],
            );
          },
        ),
      ),
    );
  }

  StepState _getState(index) {
    if (_position == index) return StepState.editing;
    if (_position > index) return StepState.complete;
    return StepState.indexed;
  }
}
