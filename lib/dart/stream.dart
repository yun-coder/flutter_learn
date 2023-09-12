// todo Stream

// todo 创建 Stream
import 'dart:async';

Stream<int> timedCounter(Duration interval, [int? maxCount]) async* {
  int i = 0;
  while (true) {
    await Future.delayed(interval);
    yield i++;
    if (i == maxCount) break;
  }
}

// todo Future 转换成 Stream  Iterable==> 可迭代的
Stream<T> streamFromFuture<T>(Iterable<Future<T>> futures) async* {
  for (final future in futures) {
    var res = await future;
    yield res;
  }
}

void main() {
  // todo 创建 streams 监听
  var listeners = 0;
  StreamController<int>? controller;
  controller = StreamController<int>(onListen: () {
    // Emit a new value every time the stream gets a new listener.
    controller!.add(listeners++);
    // Close the stream after the fifth listener.
    if (listeners > 5) controller.close();
  });
  // Get the stream for the stream controller
  var stream = controller.stream;
  // Listen to the stream
  stream.listen((int value) {
    // print('$value'); // 0
  });
}
