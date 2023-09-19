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
  double _width = 100;

  final String text = "桃树，杏树，梨树都是树。你不让我，我不让你。都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。"
      "花里带着甜味；闭上眼，树上已经满是桃儿，杏儿，梨儿。花下成百上千的蜜蜂嗡嗡地闹着，大小的蝴蝶飞来飞去。"
      "野花遍地是：杂样儿，有名字的，没名字的，散在草丛里，像眼睛，像星星，还眨呀眨呀的";
  bool expand = false;
  int maxLines = 3;

  final TextStyle style = const TextStyle(
      fontSize: 15,
      color: Colors.grey,
      shadows: [Shadow(color: Colors.white, offset: Offset(1, 1))]);

  BoxDecoration get boxDecoration => BoxDecoration(
      color: Colors.cyanAccent.withAlpha(8),
      borderRadius: const BorderRadiusDirectional.all(Radius.circular(20)));

  late TextPainter textPainter;

  @override
  void initState() {
    super.initState();
    textPainter = TextPainter(
      text: TextSpan(text: text,style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局构造器"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: _width,
            child: LayoutBuilder(builder: (_, zone) {
              if (zone.maxWidth <= 150) {
                return _buildType1();
              } else {
                return _buildType2(zone);
              }
            }),
          ),
          _buildSlider(),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: boxDecoration,
            padding: const EdgeInsets.all(15),
            child: LayoutBuilder(
              builder: (_, size) {
                textPainter.layout(maxWidth: size.maxWidth);
                if (textPainter.didExceedMaxLines) {
                  return Text(
                    text,
                    style: style,
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      text,
                      maxLines: expand ? null : 3,
                      style: style,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expand = !expand;
                        });
                      },
                      child: Text(
                        expand ? '<<收起' : '<<展开',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Slider(
        value: _width,
        min: 50,
        max: 300,
        label: "父级宽度：${_width.toStringAsFixed(1)}",
        onChanged: (v) {
          setState(() {
            _width = v;
          });
        });
  }

  Widget _buildType1() {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          _buildTitle(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildContent(),
          )
        ],
      ),
    );
  }

  Widget _buildType2(BoxConstraints zone) {
    return Container(
      height: 100,
      width: zone.maxWidth,
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            height: 80,
            width: 30,
            color: Colors.grey,
          ),
          Expanded(child: _buildContent())
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      color: Colors.grey,
      height: 30,
    );
  }

  Widget _buildContent() {
    return Wrap(
      runSpacing: 3,
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 30,
        ),
        Container(
          color: Colors.yellow,
          height: 30,
        ),
        Container(
          color: Colors.green,
          height: 30,
        ),
      ],
    );
  }
}
