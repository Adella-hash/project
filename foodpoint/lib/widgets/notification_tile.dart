import 'package:flutter/material.dart';
import 'package:foodpoint/models/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: notification.isRead ? Colors.grey : Colors.orange,
        child: const Icon(Icons.notifications, color: Colors.white),
      ),
      title: Text(
        notification.title,
        style: TextStyle(
          fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(notification.message),
      trailing: Text(
        '${notification.date.hour}:${notification.date.minute}',
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
