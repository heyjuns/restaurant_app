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
  TextEditingController searchQueryController = TextEditingController();
  bool isSearching = false;
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          hintText: "Search Data...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white30),
        ),
        style: const TextStyle(color: Colors.white, fontSize: 16.0),
        onChanged: (query) {
          cubit.getListBySearch(query);
        });
  }
}
