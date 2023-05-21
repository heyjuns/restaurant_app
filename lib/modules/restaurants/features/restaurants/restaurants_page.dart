import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/widgets/restaurant_item.dart';

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

  @override
  void initState() {
    super.initState();
    cubit = RestaurantsCubit(
      restaurantImpl: RestaurantImpl(),
    )..getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Restaurant',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'Recommendation restarurant for you!',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              BlocProvider(
                create: (context) => cubit,
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
                        child: ListView.builder(
                          itemCount: cubit.listOfRestaurant.length,
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
}
