import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {

  static Future<void> showErrorNotification(
      dynamic error, StackTrace stackTrace) async {
    final String errorMessage = error.toString();
    final String stackTraceString = stackTrace.toString();
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const String channelId = "12321";
    const String channelName = 'Channel name';
    const String channelDescription = 'Channel description';
    const Importance channelImportance = Importance.max;
    const bool playSound = false;
    const bool enableVibration = true;
    const bool showBadge = true;
    const bool enableLights = false;

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      channelId, // Provide a unique channel ID
      channelName, // Provide a channel name
      channelDescription: channelDescription, // Provide a channel description
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    // Check if the channel exists
    final List<AndroidNotificationChannel>? availableChannels =
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.getNotificationChannels();

    final bool channelExists =
        availableChannels?.any((channel) => channel.name == channelName) ??
            false;

    // Create the channel if it doesn't exist
    if (!channelExists) {
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
          channelId, channelName,
          description: channelDescription,
          importance: channelImportance,
          playSound: playSound,
          enableVibration: enableVibration,
          showBadge: showBadge,
          enableLights: enableLights);
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }

    await flutterLocalNotificationsPlugin.show(
      0, // Provide a unique notification ID
      'Exception Occurred', // Notification title
      '$errorMessage\n\n$stackTraceString',
      // Notification body with error and stack trace
      platformChannelSpecifics,
    );
  }
}