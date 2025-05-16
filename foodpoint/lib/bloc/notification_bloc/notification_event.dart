abstract class NotificationEvent {}

class NewNotificationReceived extends NotificationEvent {
  final String message;

  NewNotificationReceived(this.message);
}
