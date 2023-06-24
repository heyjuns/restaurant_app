import 'dart:convert';
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_summary_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'package:rxdart/rxdart.dart';

import 'navigation.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(FlutterLocalNotificationsPlugin flnp) async {
    const initSettingsAndroid = AndroidInitializationSettings('app_icon');

    const initSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    const initializationSettings = InitializationSettings(
        android: initSettingsAndroid, iOS: initSettingsIOS);

    await flnp.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        // log('notification payload: $payload');
      }
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  Future<void> showNotification(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      List<RestaurantSummaryEntity> response) async {
    const channelId = "1";
    const channelName = "channel_01";
    const channelDescription = "restaurant highlight";

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName, channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: DefaultStyleInformation(true, true));

    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    const titleNotification = "<b>Restaurant Highlight</b>";
    final randomIndex = Random().nextInt(response.length);
    String message = '${response[randomIndex].name} waiting for you to come';

    await flutterLocalNotificationsPlugin.show(
        0, titleNotification, message, platformChannelSpecifics,
        payload: jsonEncode(response[0].toMap()));
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen(
      (String payload) async {
        final data = RestaurantSummaryModel.fromJson(json.decode(payload));
        Navigation.intentWithData(route, data);
      },
    );
  }
}
