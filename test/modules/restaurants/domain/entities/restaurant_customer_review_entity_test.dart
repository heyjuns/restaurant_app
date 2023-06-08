import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

void main() {
  group('RestaurantCustomerReviewEntity', () {
    test('should create a RestaurantCustomerReviewEntity instance', () {
      // Arrange
      const name = 'John Doe';
      const review = 'Great food and service!';
      const date = '2023-06-08';

      // Act
      final reviewEntity = RestaurantCustomerReviewEntity(
        name: name,
        review: review,
        date: date,
      );

      // Assert
      expect(reviewEntity.name, equals(name));
      expect(reviewEntity.review, equals(review));
      expect(reviewEntity.date, equals(date));
    });
  });
}
