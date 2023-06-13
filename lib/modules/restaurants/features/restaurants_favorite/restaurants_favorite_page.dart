import 'package:flutter/material.dart';

class RestaurantsFavoritePage extends StatelessWidget {
  const RestaurantsFavoritePage({super.key});
  static const routeName = "/favorite";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
      ),
    );
  }
}
