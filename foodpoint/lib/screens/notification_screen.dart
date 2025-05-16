// notification_screen.dart
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Новое обновление доступно'),
            subtitle: Text('Проверьте последние изменения в приложении'),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Новое меню в ресторане X'),
          ),
        ],
      ),
    );
  }
}
