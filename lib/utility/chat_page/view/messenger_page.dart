import 'package:chatify/utility/chat_page/view/messenger_form.dart';
import 'package:flutter/material.dart';

class MessengerPage extends StatefulWidget {
  const MessengerPage({super.key});

  @override
  State<MessengerPage> createState() => _MessengerPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (context) => const MessengerPage(),
    );
  }
}

class _MessengerPageState extends State<MessengerPage> {
  @override
  Widget build(BuildContext context) {

    return const MessengerForm();
  }
}
