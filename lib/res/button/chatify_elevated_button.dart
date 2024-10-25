import 'package:chatify/res/progress_indicator/chatify_progress_indicator.dart';
import 'package:flutter/material.dart';

class ChatifyElevatedButton extends StatelessWidget {
  const ChatifyElevatedButton({super.key, required this.label, this.onPressed, this.isLoading, this.icon});

  final bool? isLoading;
  final Widget label;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isLoading ?? false) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: SizedBox(width: 16, height: 16, child: loadingIcon()),
        label: label,
      );
    }
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: SizedBox(width: 16, height: 16, child: FittedBox(child: icon!)),
        label: label,
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      child: label,
    );
  }

  Widget loadingIcon() {
    return ChatifyProgressIndicator();
  }
}
