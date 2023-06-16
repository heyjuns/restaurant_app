import 'package:equatable/equatable.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

class ResponseRestaurantAddReviewEntity extends Equatable {
  final bool error;
  final String message;
  final List<RestaurantCustomerReviewEntity> customerReviews;

  const ResponseRestaurantAddReviewEntity({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        customerReviews,
      ];
}
