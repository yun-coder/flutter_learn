// 异步支持

// todo 指定库前缀 import * as aliasName
// todo 导入库的一部分 import * show partOfName
// todo 延迟加载库 import * deferred as aliasName 当需要使用的时候使用库标识符 loadLibrary() 函数来加载库  使用 async await 异步加载

// 异步函数
// 要在应用程序的 main() 函数中使用异步 for循环， main() 函数体必须标记为 async`
Future main() async {
  // lookVersion() {}

  // todo 如果函数没有返回值 需要手动设置类型为 Future <void>
  // Future checkVersion() async {
  //   var version = await lookVersion();
  // }

  // todo 异步for循环
  // await for(var part in expression){}

  // todo 生成器
  // Synchronous 生成器： 返回一个 Iterable 对象。  同步生成器 返回一个可迭代的对象
  // Iterable<int> naturalsTo(int n) sync* {
  //   int k = 0;
  //   while (k < n) {
  //     yield k++;
  //   }
  // }

  // Asynchronous 生成器： 返回一个 Stream 对象。   异步生成器 返回一个流对象
  // Stream<int> asyncNaturalsTo(int n) async* {
  //   int k = 0;
  //   while (k < n) {
  //     yield k++;
  //   }
  // }

  // 如果生成器是递归的可以使用 yield* 来提高其性能
  // Iterable<int> naturalsDownFrom(int n) sync* {
  //   if (n > 0) {
  //     yield n;
  //     yield* naturalsDownFrom(n - 1);
  //   }
  // }
}
