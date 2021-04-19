
import 'package:flutter/material.dart';

enum NotificationType{
  information,
  oncoming,
  completed,
  cancelled,
  message
}

class NotificationModel{
  int notificationId;
  String notificationTitle;
  NotificationType notificationType;

  NotificationModel(this.notificationTitle, this.notificationType);

  @override
  String toString() {
    return 'Notification{notificationId: $notificationId, notificationTitle: $notificationTitle, notificationType: $notificationType}';
  }

  IconData get typeIcon{
    switch(notificationType){
      case NotificationType.information:
        return Icons.info_outline_rounded;
      case NotificationType.completed:
        return Icons.check_circle_outlined;
      case NotificationType.oncoming:
        return Icons.access_time_outlined;
      case NotificationType.cancelled:
        return Icons.cancel_outlined;
      case NotificationType.message:
        return Icons.message_outlined;
      default:
        return Icons.info_outline_rounded;
    }
  }
}