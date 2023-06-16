import 'package:equatable/equatable.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class ResponseRestaurantListEntity extends Equatable {
  final bool error;
  final String message;
  final num count;
  final List<RestaurantSummaryEntity> restaurants;

  const ResponseRestaurantListEntity({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        count,
        restaurants,
      ];
}
