abstract class SettingsPageEvent {}

class TogglePushNotificationEvent extends SettingsPageEvent {}

// settings_page_state.dart
abstract class SettingsPageState {}

class SettingsPageInitialState extends SettingsPageState {}

class PushNotificationToggledState extends SettingsPageState {
  final bool isEnabled;

  PushNotificationToggledState(this.isEnabled);
}
