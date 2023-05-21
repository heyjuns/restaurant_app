import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';

class RestaurantRatingReviewPage extends StatelessWidget {
  static const routeName = "/restaurant-rating-review";
  final RestaurantDetailEntity restaurant;
  const RestaurantRatingReviewPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating and Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      restaurant.rating.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                    ),
                    Row(
                      children: [
                        Icon(
                          restaurant.rating > 0
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          restaurant.rating > 1
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          restaurant.rating > 2
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          restaurant.rating > 3
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          restaurant.rating > 4
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Text(
                        '${restaurant.customerReviews.length.toString()} ratings')
                  ],
                ),
                const VerticalDivider(
                  thickness: 2,
                ),
                Expanded(
                  child: Column(
                    children: [
                      buildRatingSummary(5, Random().nextDouble()),
                      buildRatingSummary(4, Random().nextDouble()),
                      buildRatingSummary(3, Random().nextDouble()),
                      buildRatingSummary(2, Random().nextDouble()),
                      buildRatingSummary(1, Random().nextDouble()),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Customer Review',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: restaurant.customerReviews.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text(restaurant.customerReviews[index].name[0]
                            .toUpperCase())),
                    title: Text(restaurant.customerReviews[index].review),
                    subtitle: Text(
                        "${restaurant.customerReviews[index].name} - ${restaurant.customerReviews[index].date}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRatingSummary(num star, double value) {
    return Row(
      children: [
        Text(star.toString()),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
          ),
        )
      ],
    );
  }
}
