import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat, size: 100),
            Padding(padding: EdgeInsets.all(8)),
            SizedBox.square(
              dimension: 48,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
