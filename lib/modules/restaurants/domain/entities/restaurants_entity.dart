import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class RestaurantsEntity {
  final List<RestaurantSummaryEntity> restaurants;

  RestaurantsEntity({
    required this.restaurants,
  });
}
