import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongTap,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongTap;

  void playTapSound() {
    AudioPlayer().play(AssetSource('audio/tap_sound_1.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        playTapSound();
        if (onTap != null) onTap!();
      },
      onDoubleTap: onDoubleTap,
      onLongPress: onLongTap,
      splashColor: theme.primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(800),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ),
    );
  }
}
