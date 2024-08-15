import 'package:offers/repositories/log.dart';

class LogImpl implements Log {
  bool isDebug = true;

  @override
  void d(String tag, String context) {
    if (isDebug) print("[$tag] $context");
  }

  @override
  void e(String tag, String context) {
    print("[Error][$tag] $context");
  }

  @override
  void i(String tag, String context) {
    print("[$tag] $context");
  }
}
