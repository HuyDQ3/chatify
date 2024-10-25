import 'package:flutter/foundation.dart';

CustomLogger logger = CustomLogger();

class CustomLogger {
  void log({String? name, Object? error, StackTrace? stackTrace}) {
    debugPrint("$error\n$stackTrace");
  }
}