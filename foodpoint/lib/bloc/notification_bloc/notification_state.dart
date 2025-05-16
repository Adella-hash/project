abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationReceived extends NotificationState {
  final String message;

  NotificationReceived(this.message);
}
