import 'package:flutter/material.dart';

class CustomContents extends StatefulWidget {
  const CustomContents({super.key});

  @override
  State<StatefulWidget> createState() => _Contents();
}

class _Contents extends State<CustomContents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("内容构建"),
      ),
      body: ListView(
        children: [imageSection, titleSection, buttonSection, textSection],
      ),
    );
  }

  Widget imageSection = Image.asset("images/lake.jpg",
      width: 600, height: 240, fit: BoxFit.cover);

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text("Oeschinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text("Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey[500]))
          ],
        )),
        Icon(Icons.star, color: Colors.red[500]),
        const Text('41')
      ],
    ),
  );

  static Column _buildColumn(IconData icon, String title) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue[500]),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue[500])),
          )
        ]);
  }

  Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildColumn(Icons.call, "CALL"),
      _buildColumn(Icons.near_me, "ROUTE"),
      _buildColumn(Icons.share, "SHARE"),
    ],
  );
  // todo softWrap:true  文本将在填充满列宽后在单词边界处自动换行
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
}
