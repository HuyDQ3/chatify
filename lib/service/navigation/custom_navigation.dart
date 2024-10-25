import 'dart:async';

import 'package:flutter/material.dart';

CustomNavigator customNavigator = CustomNavigator();

class CustomNavigator {
  FutureOr<void> push(BuildContext context, Widget screen) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  FutureOr<void> pop(BuildContext context) async {
    Navigator.of(context).pop();
  }
}