import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_state.dart';
import 'package:restaurant_app/utils/background_service.dart';
import 'package:restaurant_app/utils/datetime_helper.dart';
import 'package:restaurant_app/utils/shared_helper.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  final SharedHelper sharedHelper = SharedHelper();

  SettingsPageBloc() : super(SettingsPageInitialState()) {
    on<TogglePushNotificationEvent>((event, emit) {
      toggleNotification();

      emit(PushNotificationToggledState());
    });
  }
  Future<bool> getHasNotification() async {
    return await sharedHelper.hasNotification;
  }

  void setHasNotification(bool value) {
    sharedHelper.setHasNotification(value);
  }

  Future<bool> toggleNotification() async {
    if (await getHasNotification()) {
      return await AndroidAlarmManager.periodic(
        const Duration(minutes: 24),
        1,
        BackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
