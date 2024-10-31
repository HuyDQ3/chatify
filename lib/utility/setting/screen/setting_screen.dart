import 'package:chatify/constant/text/text_constant.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.setting),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(TextConstant.setting),
      ),
    );
    return Center(
      child: Text(TextConstant.setting),
    );
  }
}

