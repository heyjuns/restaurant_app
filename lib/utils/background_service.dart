import 'dart:isolate';
import 'dart:ui';

import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'notification_helper.dart';
import 'package:restaurant_app/main.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService _instance = BackgroundService._internal();
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance;

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async {
    print('Alarm fired!');
    final NotificationHelper notificationHelper = NotificationHelper();
    final result = await RestaurantImpl().getListOfRestaurant();
    await notificationHelper.showNotification(flnp, result.restaurants);

    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
