import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  // Инициализация уведомлений
  static Future<void> init() async {
    AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings settings = InitializationSettings(
      android: androidSettings as AndroidInitializationSettings?,
    );

    await _notifications.initialize(settings);
    print('Уведомления инициализированы');
  }

  // Показ уведомления
  static Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'default_channel',
      'Основной канал',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails platformDetails =
        NotificationDetails(android: androidDetails);

    await _notifications.show(id, title, body, platformDetails);
    print('Уведомление показано: $title');
  }
}

// Removed the custom AndroidInitializationSettings class to avoid conflict
