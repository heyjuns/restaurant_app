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
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: FutureBuilder<bool>(
                future: bloc.getHasNotification(),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      ListTile(
                        title: const Text('Restaurant Notification'),
                        subtitle: Text(snapshot.data!
                            ? 'Disabled Notifications'
                            : 'Enabled Notifications'),
                        trailing: Switch(
                          value: snapshot.data!,
                          onChanged: (value) {
                            bloc.setHasNotification(value);
                            bloc.add(TogglePushNotificationEvent());
                          },
                        ),
                      ),
                      // Add other settings options
                    ],
                  );
                }),
          );
        },
      ),
    );
  }
}
