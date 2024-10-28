import 'package:flutter/foundation.dart';

var logger = CustomLogger();

class CustomLogger {
  void log({String? name, Object? error, StackTrace? stackTrace}) {
    debugPrint("$error\n$stackTrace");
  }
}