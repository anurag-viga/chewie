import 'package:chewie/src/animated_play_pause.dart';
import 'package:flutter/material.dart';

class CenterPlayButton extends StatelessWidget {
  const CenterPlayButton({
    Key? key,
    required this.backgroundColor,
    this.iconColor,
    required this.show,
    required this.isPlaying,
    required this.isFinished,
    this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final Color? iconColor;
  final bool show;
  final bool isPlaying, isFinished;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: AnimatedOpacity(
          opacity: show ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: IconButton(
                  iconSize: 28,
                  icon: isFinished
                      ? Icon(Icons.replay, color: iconColor)
                      : AnimatedPlayPause(
                          color: iconColor,
                          playing: isPlaying,
                        ),
                  onPressed: onPressed,
                ),
              ),
            ),
          ),
        ),
      );
  }
}
