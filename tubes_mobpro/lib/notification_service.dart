import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    try {
      // Initialize settings
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);

      // Initialize plugin
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          debugPrint('Notification clicked with payload: ${details.payload}');
        },
      );

      // Request permissions
      await _requestPermissions();
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  Future<void> _requestPermissions() async {
    try {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      if (androidImplementation != null) {
        await androidImplementation.requestNotificationsPermission();
        debugPrint('Notification permission requested');
      }
    } catch (e) {
      debugPrint('Error requesting notification permission: $e');
    }
  }

  Future<void> showNotification({
    required String title,
    required String body,
    required int id,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'default_channel',
        'Default Channel',
        channelDescription: 'Default notification channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      );

      const NotificationDetails platformDetails =
          NotificationDetails(android: androidDetails);

      await flutterLocalNotificationsPlugin.show(
        id,
        title,
        body,
        platformDetails,
        payload: payload,
      );
      debugPrint('Notification sent successfully: ID=$id, Title=$title');
    } catch (e) {
      debugPrint('Error showing notification: $e');
    }
  }

  // Future<void> scheduleNotification({
  //   required String title,
  //   required String body,
  //   required int id,
  //   required DateTime scheduledDate,
  //   String? payload,
  // }) async {
  //   try {
  //     const AndroidNotificationDetails androidDetails =
  //         AndroidNotificationDetails(
  //       'scheduled_channel',
  //       'Scheduled Channel',
  //       channelDescription: 'Channel for scheduled notifications',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     );

  //     const NotificationDetails platformDetails =
  //         NotificationDetails(android: androidDetails);

  //     await flutterLocalNotificationsPlugin.schedule(
  //       id,
  //       title,
  //       body,
  //       scheduledDate,
  //       platformDetails,
  //       payload: payload,
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     );
  //     debugPrint('Scheduled notification set for: $scheduledDate');
  //   } catch (e) {
  //     debugPrint('Error scheduling notification: $e');
  //   }
  // }
}
