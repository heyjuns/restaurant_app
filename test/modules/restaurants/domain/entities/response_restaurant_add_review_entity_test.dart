import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';

void main() {
  group('ResponseRestaurantAddReviewEntity', () {
    test('should create a ResponseRestaurantAddReviewEntity instance', () {
      // Arrange
      const error = false;
      const message = 'Review added successfully';
      final customerReviews = [
        RestaurantCustomerReviewEntity(
          name: 'John Doe',
          review: 'Great food and service!',
          date: '2023-06-08',
        ),
        RestaurantCustomerReviewEntity(
          name: 'Jane Smith',
          review: 'Amazing experience!',
          date: '2023-06-09',
        ),
      ];

      // Act
      final responseEntity = ResponseRestaurantAddReviewEntity(
        error: error,
        message: message,
        customerReviews: customerReviews,
      );

      // Assert
      expect(responseEntity.error, equals(error));
      expect(responseEntity.message, equals(message));
      expect(responseEntity.customerReviews, equals(customerReviews));
    });
  });
}
