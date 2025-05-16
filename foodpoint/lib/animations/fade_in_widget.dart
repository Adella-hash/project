import 'package:flutter/material.dart';

class FadeInWidget extends StatelessWidget {
  final Widget child;
  final int duration;

  const FadeInWidget({super.key, required this.child, this.duration = 500});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}
