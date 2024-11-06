import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/setting_page/setting_page.dart';
import 'package:flutter/material.dart';

import '../../chat_page/chat_page.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  List<BottomNavigationBarItem> items(BuildContext context) => [
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: TextConstant.chat,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: TextConstant.setting,
    ),
  ];

  List<Widget> widgetOptions(BuildContext context) => [
    const ConversationPage(),
    const SettingPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      body: widgetOptions(context).elementAt(currentIndex),
      // body: widgetOptions(context).elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items(context),
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
