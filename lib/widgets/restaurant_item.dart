import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/restaurant_entity.dart';
import 'package:restaurant_app/restaurant_detail.dart';
import 'package:restaurant_app/widgets/subtitle_icon.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantEntity restaurant;
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetailScreen.routeName,
            arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    restaurant.pictureId,
                    errorBuilder: (ctx, error, _) =>
                        const Center(child: Icon(Icons.error)),
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SubtitleIcon(
                    icons: Icons.location_pin,
                    subtitle: restaurant.city,
                    iconColor: Colors.red,
                  ),
                  const SizedBox(
                    height: 8,
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
    );
  }
}
