import 'dart:math';

import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_rating_review/restaurant_rating_review_cubit.dart';

import '../../data/repositories/restaurant_impl.dart';

class RestaurantRatingReviewPage extends StatefulWidget {
  static const routeName = "/restaurant-rating-review";
  final RestaurantDetailEntity restaurant;
  const RestaurantRatingReviewPage({super.key, required this.restaurant});

  @override
  State<RestaurantRatingReviewPage> createState() =>
      _RestaurantRatingReviewPageState();
}

class _RestaurantRatingReviewPageState
    extends State<RestaurantRatingReviewPage> {
  late RestaurantRatingReviewCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = RestaurantRatingReviewCubit(
      restaurantImpl: RestaurantImpl(),
    );
  }

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
                      widget.restaurant.rating.toString(),
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
                          widget.restaurant.rating > 0
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          widget.restaurant.rating > 1
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          widget.restaurant.rating > 2
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          widget.restaurant.rating > 3
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Icon(
                          widget.restaurant.rating > 4
                              ? Icons.star_rounded
                              : Icons.star_outline,
                          size: 12,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    Text(
                        '${widget.restaurant.customerReviews.length.toString()} ratings')
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer Review',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController name = TextEditingController();
                        TextEditingController review = TextEditingController();
                        return AlertDialog(
                          title: const Text('Tell us about the restaurant'),
                          content: IntrinsicHeight(
                            child: Column(
                              children: [
                                TextField(
                                  controller: name,
                                  decoration: const InputDecoration(
                                    label: Text('Name'),
                                  ),
                                ),
                                TextField(
                                  controller: review,
                                  decoration: const InputDecoration(
                                    label: Text('Review'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.red),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            ElevatedButton(
                                onPressed: () {
                                  print(
                                      'name: ${name.text} review: ${review.text}');
                                  cubit.postRestaurantReview(
                                      widget.restaurant.id,
                                      name.text,
                                      review.text);
                                },
                                child: const Text(
                                  'Add Review',
                                )),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('Add Review'),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: widget.restaurant.customerReviews.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text(widget
                            .restaurant.customerReviews[index].name[0]
                            .toUpperCase())),
                    title:
                        Text(widget.restaurant.customerReviews[index].review),
                    subtitle: Text(
                        "${widget.restaurant.customerReviews[index].name} - ${widget.restaurant.customerReviews[index].date}"),
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
