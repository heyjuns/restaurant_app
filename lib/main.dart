import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/restaurants_page.dart';
import 'package:restaurant_app/restaurant_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RestaurantListPage.routeName,
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailScreen.routeName: (context) => RestaurantDetailScreen(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantDetailEntity,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
