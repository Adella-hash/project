// lib/models/notification_model.dart
class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime date;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.date,
    required this.isRead,
  });

  // Конвертация из JSON
  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      date: DateTime.parse(json['date'] ?? DateTime.now().toString()),
      isRead: json['isRead'] ?? false,
    );
  }

  // Конвертация в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'message': message,
      'date': date.toIso8601String(),
      'isRead': isRead,
    };
  }
}
