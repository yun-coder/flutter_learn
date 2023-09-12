import 'package:flutter/material.dart';

// todo  OverflowBox 与 UnconstrainedBox 类似，但不同的是，如果其子级超出该空间，它将不会显示任何警告
// todo Flex框（行与列）的行为方式不同，具体取决于其约束在其主方向上是有界还是无界
// 在其主方向上具有边界约束的弹性框会尝试尽可能大。
// 在其主方向上具有无界约束的弹性框会尝试在该空间中拟合其子项。 每个子项的flex值都必须设置为零，这意味着当flex框位于另一个flex框或可滚动项内时，您不能使用Expanded;否则将抛出异常。
// 交叉方向（列的宽度或行的高度）绝不能是无边界的，否则它将无法合理地对齐其子项。

class CustomConstraints extends StatelessWidget {
  const CustomConstraints({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("布局和约束"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
            child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 70,
                minHeight: 70,
                maxWidth: 150,
                maxHeight: 150,
              ),
              child: Container(color: Colors.red, width: 10, height: 10,margin: const EdgeInsets.only(bottom: 10,top: 10),),
              // child: Container(color: Colors.red, width: 1000, height: 1000),
            ),
            UnconstrainedBox(
              child: Container(color: Colors.red, width: 100, height: 20,margin: const EdgeInsets.only(bottom: 10,top: 10),),
            ),
            // OverflowBox(
            //   minWidth: 0,
            //   minHeight: 0,
            //   maxWidth: double.infinity,
            //   maxHeight: double.infinity,
            //   child: Container(color: Colors.red, width: 100, height: 20),
            // ),
            UnconstrainedBox(
              // todo  UnconstrainedBox 给 LimitedBox 一个无限的大小,但它向其子级传递了最大为 100 的约束。
              child: LimitedBox(
                maxWidth: 100,
                child: Container(
                  color: Colors.red,
                  width: double.infinity,
                  height: 100,
                ),
              ),
            ),
            const FittedBox(
              child: Text('Some Example Text.'),
            ),
            const Center(
              child: FittedBox(
                child: Text('Some Example Text.'),
              ),
            ),
            const Center(
              // todo 文本缩放
              child: FittedBox(
                child: Text(
                    'This is some very very very large text that is too big to fit a regular screen in a single line'),
              ),
            ),
            const Center(
              child: Text(
                  'This is some very very very large text that is too big to fit a regular screen in a single line.'),
            ),
            // todo FittedBox 只能在有限制的宽高中对子 widget 进行缩放（宽度和高度不会变得无限大）
            // FittedBox(
            //   child: Container(
            //     height: 20,
            //     width: double.infinity,
            //     color: Colors.red,
            //   ),
            // )
            Row(
              children: [
                Container(
                    color: Colors.red,
                    child:
                        const Text('Hello!', style: TextStyle(fontSize: 30))),
                Container(
                    color: Colors.green,
                    child:
                        const Text('Goodbye!', style: TextStyle(fontSize: 30))),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.red,
                      child: const Text(
                        'This is a very long text that won\'t fit the line.',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Container(
                    color: Colors.green,
                    child:
                        const Text('Goodbye!', style: TextStyle(fontSize: 30))),
              ],
            ),
            // todo Row 会根据所有 Expanded 的子级来计算其该有的宽度
            // Row(
            //   children: [
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            //         color: Colors.red,
            //         child: const Text(
            //           'This is a very long text that won\'t fit the line.',
            //           style: TextStyle(fontSize: 30),
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Container(
            //         margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            //         color: Colors.green,
            //         child: const Text(
            //           'Goodbye!',
            //           style: TextStyle(fontSize: 30),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // todo 如果你使用 Flexible 而不是 Expanded 的话，唯一的区别是，Flexible 会让其子级具有与 Flexible 相同或者更小的宽度。而 Expanded 将会强制其子级具有和 Expanded 相同的宽度
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.red,
                    child: const Text(
                      'This is a very long text that won\'t fit the line.',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    color: Colors.green,
                    child: const Text(
                      'Goodbye!',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
            // todo 如果你想要 Scaffold 的子级变得和 Scaffold 本身一样大的话，你可以将这个子级外包裹一个 SizedBox.expand。
            // Scaffold(
            //   body: SizedBox.expand(
            //     child: Container(
            //       color: Colors.blue,
            //       child: const Column(
            //         children: [
            //           Text('Hello!'),
            //           Text('Goodbye!'),
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        )));
  }
}
