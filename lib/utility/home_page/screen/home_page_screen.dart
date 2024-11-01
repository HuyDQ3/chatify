import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/utility/chat/conversation/screen/chat_screen.dart';
import 'package:chatify/utility/setting/screen/setting_screen.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, this.accountInfo});

  final AccountInfo? accountInfo;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
  void initState() {
    super.initState();
  }

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
