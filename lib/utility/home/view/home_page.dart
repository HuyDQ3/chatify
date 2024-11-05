import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/chat/conversation/screen/chat_screen.dart';
import 'package:chatify/utility/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (context) => const HomePage());
  }
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: TextConstant.chat,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: TextConstant.setting,
    ),
  ];

  List<Widget> widgetOptions = [
    const ChatScreen(),
    const SettingScreen(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}