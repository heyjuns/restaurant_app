import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/widgets/no_internet_widget.dart';
import 'package:restaurant_app/modules/restaurants/widgets/restaurant_item.dart';
import 'package:restaurant_app/utils/background_service.dart';

import 'restaurants_cubit.dart';
import 'restaurants_state.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurants';
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  late RestaurantsCubit cubit;
  TextEditingController searchQueryController = TextEditingController();
  bool isSearching = false;

  final BackgroundService bs = BackgroundService();
  @override
  void initState() {
    super.initState();
    cubit = RestaurantsCubit(
      restaurantImpl: RestaurantImpl(),
    )..getList();
  }

  @override
  void dispose() {
    super.dispose();
    searchQueryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? _buildSearchField() : const Text('Restomoo'),
        actions: [
          !isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: const Icon(Icons.search))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      searchQueryController.text = "";
                      cubit.getList();
                    });
                  },
                  icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Alarm with Delayed (Once)',
                    ),
                    onPressed: () async {
                      await AndroidAlarmManager.oneShot(
                        const Duration(seconds: 5),
                        1,
                        BackgroundService.callback,
                        exact: true,
                        wakeup: true,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Alarm with Date Time (Once)',
                    ),
                    onPressed: () async {
                      await AndroidAlarmManager.oneShotAt(
                        DateTime.now().add(const Duration(seconds: 5)),
                        2,
                        BackgroundService.callback,
                        exact: true,
                        wakeup: true,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Alarm with Periodic',
                    ),
                    onPressed: () async {
                      await AndroidAlarmManager.periodic(
                        const Duration(days: 1),
                        3,
                        BackgroundService.callback,
                        startAt: DateTime(DateTime.now().year,
                            DateTime.now().month, DateTime.now().day, 23, 0),
                        exact: true,
                        wakeup: true,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text(
                      'Cancel Alarm by Id',
                    ),
                    onPressed: () async {
                      await AndroidAlarmManager.cancel(3);
                    },
                  ),
                ],
              ),
              BlocProvider(
                create: (_) => cubit,
                child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
                  bloc: cubit,
                  builder: (context, state) {
                    if (state is RestaurantsLoadingState) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is RestaurantsLoadedState) {
                      return Expanded(
                        child: ListView.separated(
                          itemCount: cubit.listOfRestaurant.length,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemBuilder: (context, index) {
                            return RestaurantCard(
                                restaurant: cubit.listOfRestaurant[index]);
                          },
                        ),
                      );
                    }
                    if (state is RestaurantsErrorState) {
                      return Expanded(child: Text(state.errorMessage));
                    }
                    if (state is RestaurantsNoInternetState) {
                      return const NoInternetWidget();
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
        controller: searchQueryController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "Search Restaurant...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
        onChanged: (query) {
          cubit.getListBySearch(query);
        });
  }
}
