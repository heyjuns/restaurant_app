import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';
import 'package:restaurant_app/restaurant_detail.dart';

import 'widgets/subtitle_icon.dart';

class RestaurantsScreen extends StatelessWidget {
  static const routeName = '/restaurants';
  const RestaurantsScreen({super.key});

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
              FutureBuilder<String>(
                  future: DefaultAssetBundle.of(context)
                      .loadString('assets/restaurants.json'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Restaurant> restaurants =
                          restaurantsFromJson(snapshot.data!).restaurants;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: restaurants.length,
                          itemBuilder: (context, index) {
                            return RestaurantItemCard(
                                restaurant: restaurants[index]);
                          },
                        ),
                      );
                    }

                    return Container();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantItemCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantItemCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailScreen.routeName,
            arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    restaurant.pictureId,
                    errorBuilder: (ctx, error, _) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SubtitleIcon(
                    icons: Icons.location_pin,
                    subtitle: restaurant.city,
                    iconColor: Colors.red,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SubtitleIcon(
                    icons: Icons.star,
                    iconColor: Colors.yellow,
                    subtitle: restaurant.rating.toString(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
