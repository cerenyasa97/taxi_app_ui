import 'package:flutter_test/flutter_test.dart';
import 'package:piton_taxi_app/screens/notifications/model/notification_model.dart';


void main() {
  test('Is notification empty or not', () {
    final NotificationModel notification = NotificationModel("Your next trip is oncoming", NotificationType.oncoming);

    expect(notification.notificationTitle, "Your next trip is oncoming");
    expect(notification.notificationType, NotificationType.oncoming);
  });
}