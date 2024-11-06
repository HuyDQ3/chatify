import 'package:chatify/constant/text/text_constant.dart';
import 'package:chatify/utility/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({super.key});

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  late List<Widget> settingItems;

  @override
  void initState() {
    super.initState();
    settingItems = [
      ListTile(
        onTap: () {},
        title: const Text(TextConstant.information),
        leading: const Icon(Icons.info),
        subtitle: const Text(TextConstant.informationDetail),
      ),
      ListTile(
        onTap: () {
          context.read<AuthenticationBloc>().add(AuthenticationLogoutPressed());
          // Navigator.of(context).pop(MaterialPageRoute(
          //   builder: (context) => LoginScreen(),
          // ));
        },
        title: const Text(TextConstant.logout),
        leading: const Icon(Icons.logout),
        subtitle: const Text(TextConstant.logoutDetail),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.setting),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: settingItems.length,
        itemBuilder: (context, index) {
          return settingItems.elementAt(index);
        },
      ),
    );
  }
}
