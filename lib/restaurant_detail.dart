import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';

import 'widgets/subtitle_icon.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = '/restaurant-detail';
  final Restaurant restaurant;
  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Hero(
                  tag: restaurant.id,
                  child: Image.network(restaurant.pictureId),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(12, 4, 4, 12),
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(42))),
                    child: Text(
                      restaurant.rating.toString(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            restaurant.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SubtitleIcon(
                            subtitle: restaurant.city,
                            icons: Icons.location_pin,
                            iconColor: Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        restaurant.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const Divider(),
                      Text(
                        'Available Menus',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Wrap(
                        spacing: 8.0,
                        children: restaurant.menus.drinks.map((drink) {
                          return Chip(label: Text(drink.name));
                        }).toList(),
                      ),
                      Wrap(
                        spacing: 8.0,
                        children: restaurant.menus.foods.map((food) {
                          return Chip(label: Text(food.name));
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
