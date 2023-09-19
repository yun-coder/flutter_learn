import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Map<int, TableColumnWidth> columnWidths = {
    0: FixedColumnWidth(80.0),
    1: FixedColumnWidth(80.0),
    2: FixedColumnWidth(80.0),
    3: FixedColumnWidth(80.0),
    4: FixedColumnWidth(80.0),
  };

  @override
  Widget build(BuildContext context) {
    _ItemBean title = _ItemBean("名称", "符号", "单位", "单位名称", "单位符号");
    _ItemBean m = _ItemBean("长度", "L", "1m", "米", "m");
    _ItemBean kg = _ItemBean("质量", "M", "1kg", "千克", "kg");
    _ItemBean s = _ItemBean("时间", "T", "1s", "秒", "s");
    _ItemBean a = _ItemBean("安培", "I", "1A", "安培", "A");
    _ItemBean k = _ItemBean("热力学温度", "θ", "1K", "开尔文", "K");
    _ItemBean mol = _ItemBean("物质的量", "N", "1mol", "摩尔", "mol");
    _ItemBean cd = _ItemBean("发光强度", "J", "1cd", "坎德拉", "cd");

    List<_ItemBean> tableData = [title, m, kg, s, a, k, mol, cd];

    return Scaffold(
      appBar: AppBar(
        title: const Text("表格"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            columnWidths: columnWidths,
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border:
                TableBorder.all(color: Colors.black, style: BorderStyle.solid),
            children: tableData
                .map((item) => TableRow(children: <Widget>[
                      Center(
                        child: Text(
                          item.name,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(item.symbol),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(item.unit),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(item.unitName),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(item.unitSymbol),
                        ),
                      ),
                    ]))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemBean {
  String name;
  String symbol;
  String unit;
  String unitName;
  String unitSymbol;

  _ItemBean(this.name, this.symbol, this.unit, this.unitName, this.unitSymbol);
}
