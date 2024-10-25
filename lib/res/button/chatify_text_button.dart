import 'package:chatify/res/progress_indicator/chatify_progress_indicator.dart';
import 'package:flutter/material.dart';

class ChatifyTextButton extends StatelessWidget {
  const ChatifyTextButton({super.key, required this.label, this.onPressed, this.isLoading});

  final bool? isLoading;
  final Widget label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isLoading ?? false) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: loadingIcon(),
        label: label,
      );
    }
    return TextButton(
      onPressed: onPressed,
      child: label,
    );
  }

  Widget loadingIcon() {
    return const ChatifyProgressIndicator();
  }
}
