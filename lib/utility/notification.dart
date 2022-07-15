import 'package:awesome_notifications/awesome_notifications.dart';

class MyNotification {
  void Notify() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: "Reminder",
            body: "Renew your Subscription"),
        schedule: NotificationCalendar(day: 28));
  }
}
