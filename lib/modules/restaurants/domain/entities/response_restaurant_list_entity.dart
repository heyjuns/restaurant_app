import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class ResponseRestaurantListEntity {
  final bool error;
  final String message;
  final num count;
  final List<RestaurantSummaryEntity> restaurants;

  ResponseRestaurantListEntity({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });
}
