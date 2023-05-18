import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

class ResponseRestaurantAddReviewEntity {
  final bool error;
  final String message;
  final List<RestaurantCustomerReviewEntity> customerReviews;

  ResponseRestaurantAddReviewEntity({
    required this.error,
    required this.message,
    required this.customerReviews,
  });
}
