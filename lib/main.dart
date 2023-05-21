import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_detail/restaurant_detail_page.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurants/restaurants_page.dart';

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
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
