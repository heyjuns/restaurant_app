import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_bloc.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  static const routeName = "/settings";

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsPageBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = SettingsPageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<SettingsPageBloc, SettingsPageState>(
        builder: (context, state) {
          bool isPushNotificationEnabled = false;

          if (state is PushNotificationToggledState) {
            isPushNotificationEnabled = state.isEnabled;
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: Column(
              children: [
                ListTile(
                  title: const Text('Restaurant Notification'),
                  subtitle: Text(isPushNotificationEnabled
                      ? 'Disabled Notifications'
                      : 'Enabled Notifications'),
                  trailing: Switch(
                    value: isPushNotificationEnabled,
                    onChanged: (value) {
                      bloc.add(TogglePushNotificationEvent());
                    },
                  ),
                ),
                // Add other settings options
              ],
            ),
          );
        },
      ),
    );
  }
}
