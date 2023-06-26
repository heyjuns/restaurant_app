import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  static const notificationKey = 'notification';
  Future<bool> get hasNotification async {
    final prefs = await sharedPreferences;
    return prefs.getBool(notificationKey) ?? false;
  }

  void setHasNotification(bool hasNotification) async {
    final prefs = await sharedPreferences;
    prefs.setBool(notificationKey, hasNotification);
  }
}
