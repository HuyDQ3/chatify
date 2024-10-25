import 'package:chatify/res/progress_indicator/chatify_progress_indicator.dart';
import 'package:flutter/material.dart';

class ChatifyElevatedButton extends StatelessWidget {
  const ChatifyElevatedButton({super.key, required this.label, this.onPressed, this.isLoading});

  final bool? isLoading;
  final Widget label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isLoading ?? false) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: loadingIcon(),
        label: label,
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: label,
    );
  }

  Widget loadingIcon() {
    return const ChatifyProgressIndicator();
  }
}
