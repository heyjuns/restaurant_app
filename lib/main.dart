import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurants/restaurants_page.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurants_favorite/restaurants_favorite_page.dart';
import 'package:restaurant_app/modules/restaurants/features/settings/settings_page.dart';

import 'modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'modules/restaurants/features/restaurant_detail/restaurant_detail_page.dart';
import 'modules/restaurants/features/restaurant_rating_review/restaurant_rating_review_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: const [
            RestaurantListPage(),
            RestaurantsFavoritePage(),
            SettingsPage()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant), label: 'Restaurants'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      routes: {
        RestaurantListPage.routeName: (context) => const RestaurantListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              id: ModalRoute.of(context)?.settings.arguments as String,
            ),
        RestaurantRatingReviewPage.routeName: (context) =>
            RestaurantRatingReviewPage(
              restaurant: ModalRoute.of(context)?.settings.arguments
                  as RestaurantDetailEntity,
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
