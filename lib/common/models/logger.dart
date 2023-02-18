import 'package:logger/logger.dart';

class LogPrint {
  static void error(String errorText) {
    Logger().e(errorText);
  }
}
