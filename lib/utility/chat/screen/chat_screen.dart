import 'package:chatify/constant/text/text_constant.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.chat),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(TextConstant.chat),
      ),
    );
  }
}
