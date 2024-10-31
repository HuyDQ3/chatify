import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/login/screen/login_screen.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<SettingScreen> {
  late List<Widget> settingItems;

  @override
  void initState() {
    super.initState();
    settingItems = [
      ListTile(
        onTap: () {},
        title: Text(TextConstant.information),
        leading: Icon(Icons.info),
      ),
      ListTile(
        onTap: () {
          Navigator.of(context).pop(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
        },
        title: Text(TextConstant.logout),
        leading: Icon(Icons.logout),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TextConstant.setting),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: settingItems.length,
        itemBuilder: (context, index) {
          return settingItems.elementAt(index);
        },
      ),
    );
    return Center(
      child: Text(TextConstant.setting),
    );
  }
}
