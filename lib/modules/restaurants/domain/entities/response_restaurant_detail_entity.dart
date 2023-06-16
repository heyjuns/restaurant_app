import 'package:equatable/equatable.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';

class ResponseRestaurantDetailEntity extends Equatable {
  final bool error;
  final String message;
  final RestaurantDetailEntity restaurant;

  const ResponseRestaurantDetailEntity({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        restaurant,
      ];
}
