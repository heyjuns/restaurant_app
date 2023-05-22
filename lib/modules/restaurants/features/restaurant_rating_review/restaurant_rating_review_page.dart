import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_rating_review/restaurant_rating_review_cubit.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_rating_review/restaurant_rating_review_state.dart';

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
    cubit.restaurant = widget.restaurant;
    cubit.updateCustomerReviews(widget.restaurant.customerReviews);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating and Review'),
      ),
      body: BlocProvider(
        create: (context) => cubit,
        child: BlocBuilder<RestaurantRatingReviewCubit,
            RestaurantRatingReviewState>(builder: (context, state) {
          if (state is RestaurantRatingReviewLoadedState) {
            return Padding(
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
                            cubit.restaurant.rating.toString(),
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
                                cubit.restaurant.rating > 0
                                    ? Icons.star_rounded
                                    : Icons.star_outline,
                                size: 12,
                                color: Colors.amber,
                              ),
                              Icon(
                                cubit.restaurant.rating > 1
                                    ? Icons.star_rounded
                                    : Icons.star_outline,
                                size: 12,
                                color: Colors.amber,
                              ),
                              Icon(
                                cubit.restaurant.rating > 2
                                    ? Icons.star_rounded
                                    : Icons.star_outline,
                                size: 12,
                                color: Colors.amber,
                              ),
                              Icon(
                                cubit.restaurant.rating > 3
                                    ? Icons.star_rounded
                                    : Icons.star_outline,
                                size: 12,
                                color: Colors.amber,
                              ),
                              Icon(
                                cubit.restaurant.rating > 4
                                    ? Icons.star_rounded
                                    : Icons.star_outline,
                                size: 12,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          Text(
                              '${cubit.customerReviews.length.toString()} ratings')
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
                              TextEditingController name =
                                  TextEditingController();
                              TextEditingController review =
                                  TextEditingController();
                              return AlertDialog(
                                title:
                                    const Text('Tell us about the restaurant'),
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
                                        cubit.postRestaurantReview(
                                            cubit.restaurant.id,
                                            name.text,
                                            review.text);
                                        Navigator.of(context).pop();
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
                  buildCustomerReviews(),
                ],
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }

  Widget buildCustomerReviews() {
    return Expanded(
      child: ListView.separated(
        itemCount: cubit.customerReviews.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                cubit.customerReviews[index].name[0].toUpperCase(),
              ),
            ),
            title: Text(cubit.customerReviews[index].review),
            subtitle: Text(
                "${cubit.customerReviews[index].name} - ${cubit.customerReviews[index].date}"),
          );
        },
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
