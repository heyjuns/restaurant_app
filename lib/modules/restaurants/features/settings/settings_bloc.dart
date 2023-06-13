import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_state.dart';

class SettingsPageBloc extends Bloc<SettingsPageEvent, SettingsPageState> {
  bool isPushNotificationEnabled = false;
  SettingsPageBloc() : super(SettingsPageInitialState()) {
    on<TogglePushNotificationEvent>((event, emit) {
      isPushNotificationEnabled = !isPushNotificationEnabled;
      emit(PushNotificationToggledState(isPushNotificationEnabled));
    });
  }

  Stream<SettingsPageState> mapEventToState(SettingsPageEvent event) async* {
    if (event is TogglePushNotificationEvent) {
      isPushNotificationEnabled = !isPushNotificationEnabled;
      yield PushNotificationToggledState(isPushNotificationEnabled);
    }
  }
}
