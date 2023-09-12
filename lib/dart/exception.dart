// Dart 异常
typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;

  const ExceptionWithMessage(this.message);
}

// Call logException to log an exception, and doneLogging when finished.
abstract class Logger {
  void logException(Type t, [String? msg]);

  void doneLogging();
}

void main() {
  // 抛出异常
  // void tryFunction(VoidFunction untrustworthy, Logger logger) {
  //   try {
  //     untrustworthy();
  //   } on ExceptionWithMessage catch (e) {
  //     logger.logException(e.runtimeType, e.message);
  //   } on Exception {
  //     logger.logException(Exception);
  //   } catch (e) {
  //     rethrow; // todo 重新抛出
  //   } finally {
  //     logger.doneLogging();
  //   }
  // }
}
