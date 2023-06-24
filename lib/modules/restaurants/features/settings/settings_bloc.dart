import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_state.dart';
import 'package:restaurant_app/utils/background_service.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  bool isPushNotificationEnabled = false;
  SettingsPageBloc() : super(SettingsPageInitialState()) {
    on<TogglePushNotificationEvent>((event, emit) {
      isPushNotificationEnabled = !isPushNotificationEnabled;
      toggleNotification();
      emit(PushNotificationToggledState(isPushNotificationEnabled));
    });
  }

  Stream<SettingsPageState> mapEventToState(SettingsPageEvent event) async* {
    if (event is TogglePushNotificationEvent) {
      isPushNotificationEnabled = !isPushNotificationEnabled;
      yield PushNotificationToggledState(isPushNotificationEnabled);
    }
  }

  Future<bool> toggleNotification() async {
    if (isPushNotificationEnabled) {
      return await AndroidAlarmManager.periodic(
        //TODO change to 11AM and duration 24 hours
        const Duration(minutes: 1),
        1,
        BackgroundService.callback,
        startAt: DateTime.now(),
        exact: true,
        wakeup: true,
      );
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
