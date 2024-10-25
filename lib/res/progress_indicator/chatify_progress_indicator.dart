import 'package:flutter/material.dart';

class ChatifyProgressIndicator extends StatelessWidget {
  const ChatifyProgressIndicator({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(value: value);
  }
}
