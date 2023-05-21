import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_detail/restaurant_detail_state.dart';
import 'package:restaurant_app/utils.dart';

import 'restaurant_detail_cubit.dart';

class RestaurantDetailPage extends StatefulWidget {
  static const routeName = '/restaurant-detail';
  final String id;
  const RestaurantDetailPage({
    super.key,
    required this.id,
  });

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  late RestaurantDetailCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RestaurantDetailCubit(
      restaurantImpl: RestaurantImpl(),
    )..getDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            BlocProvider(
              create: (context) => cubit,
              child: BlocBuilder<RestaurantDetailCubit, RestaurantDetailState>(
                builder: (context, state) {
                  if (state is RestaurantDetailLoadingState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is RestaurantDetailLoadedState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Stack(
                          children: [
                            Hero(
                              tag: state.restaurant.pictureId,
                              child: Image.network(Utils.getImageUrl(
                                  'medium', state.restaurant.pictureId)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.chevron_left,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        buildCard(state, context),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Foods',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.restaurant.menus.foods.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(state
                                        .restaurant.menus.foods[index].name),
                                  );
                                },
                              ),
                              Text(
                                'Drinks',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.restaurant.menus.drinks.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text(state
                                        .restaurant.menus.drinks[index].name),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildCard(RestaurantDetailLoadedState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${state.restaurant.name} - ${state.restaurant.city}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Divider(height: 32),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    state.restaurant.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                      '(${state.restaurant.customerReviews.length.toString()})'),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    width: 4,
                    height: 4,
                  ),
                  const Text('Rating and reviews'),
                ],
              ),
              const Divider(height: 32),
              Text(state.restaurant.description),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.restaurant.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        label: Text(
                          state.restaurant.categories[index].name,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
