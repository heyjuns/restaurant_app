import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/restaurant_entity.dart';
import 'package:restaurant_app/restaurant_detail.dart';
import 'package:restaurant_app/restaurants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RestaurantsScreen.routeName,
      routes: {
        RestaurantsScreen.routeName: (context) => const RestaurantsScreen(),
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantEntity,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
