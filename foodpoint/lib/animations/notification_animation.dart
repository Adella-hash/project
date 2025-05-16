import 'package:flutter/material.dart';

class NotificationAnimation extends StatelessWidget {
  final String message;

  const NotificationAnimation({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, Offset offset, child) {
        return SlideTransition(
          position: AlwaysStoppedAnimation<Offset>(offset),
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
