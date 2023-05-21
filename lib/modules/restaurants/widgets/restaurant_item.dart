import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_detail/restaurant_detail_page.dart';
import 'package:restaurant_app/utils.dart';

import 'subtitle_icon.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantSummaryEntity restaurant;
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant.id);
        },
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Hero(
                      tag: restaurant.id,
                      child: Image.network(
                        Utils.getImageUrl("small", restaurant.pictureId),
                        fit: BoxFit.cover,
                        errorBuilder: (ctx, error, _) =>
                            const Center(child: Icon(Icons.error)),
                      ),
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SubtitleIcon(
                          icons: Icons.location_pin,
                          subtitle: restaurant.city,
                          iconColor: Colors.red,
                        ),
                      ],
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
      ),
    );
  }
}
