import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';

class ResponseRestaurantDetailEntity {
  final bool error;
  final String message;
  final RestaurantDetailEntity restaurant;

  ResponseRestaurantDetailEntity({
    required this.error,
    required this.message,
    required this.restaurant,
  });
}
