import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/widgets/restaurant_item.dart';
import 'package:restaurant_app/utils/database_cubit.dart';
import 'package:restaurant_app/utils/database_state.dart';

class RestaurantsFavoritePage extends StatefulWidget {
  const RestaurantsFavoritePage({super.key});
  static const routeName = "/favorite";

  @override
  State<RestaurantsFavoritePage> createState() =>
      _RestaurantsFavoritePageState();
}

class _RestaurantsFavoritePageState extends State<RestaurantsFavoritePage> {
  late DatabaseCubit dbCubit;

  @override
  void initState() {
    super.initState();
    dbCubit = BlocProvider.of<DatabaseCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider.value(
            value: dbCubit,
            child: BlocBuilder<DatabaseCubit, DatabaseState>(
              builder: (context, state) {
                if (dbCubit.favoriteRestaurants.isNotEmpty) {
                  return ListView.separated(
                    itemCount: dbCubit.favoriteRestaurants.length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      return RestaurantCard(
                          restaurant: dbCubit.favoriteRestaurants[index]);
                    },
                  );
                }
                return const Center(
                  child: Text('you have no favorites restaurants'),
                );
              },
            )),
      ),
    );
  }
}
