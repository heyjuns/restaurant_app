import 'package:flutter/material.dart';

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
              // FutureBuilder<String>(
              //   future: DefaultAssetBundle.of(context)
              //       .loadString('assets/restaurants.json'),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       final List<RestaurantEntity> restaurants =
              //           restaurantsFromJson(snapshot.data!).restaurants;
              //       return Expanded(
              //         child: ListView.builder(
              //           itemCount: restaurants.length,
              //           itemBuilder: (context, index) {
              //             return RestaurantItemCard(
              //                 restaurant: restaurants[index]);
              //           },
              //         ),
              //       );
              //     }

              //     return Container();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
