import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_customer_review_model.dart';

void main() {
  group('RestaurantCustomerReviewModel', () {
    test('should create a RestaurantCustomerReviewModel instance from JSON',
        () {
      // Arrange
      final json = {
        "name": "John Doe",
        "review": "Great restaurant",
        "date": "2022-01-01"
      };

      // Act
      final restaurantCustomerReviewModel =
          RestaurantCustomerReviewModel.fromJson(json);

      // Assert
      expect(
          restaurantCustomerReviewModel, isA<RestaurantCustomerReviewModel>());
      expect(restaurantCustomerReviewModel.name, equals("John Doe"));
      expect(restaurantCustomerReviewModel.review, equals("Great restaurant"));
      expect(restaurantCustomerReviewModel.date, equals("2022-01-01"));
    });

    test('should handle null values in JSON', () {
      // Arrange
      final json = {"name": null, "review": null, "date": null};

      // Act
      final restaurantCustomerReviewModel =
          RestaurantCustomerReviewModel.fromJson(json);

      // Assert
      expect(
          restaurantCustomerReviewModel, isA<RestaurantCustomerReviewModel>());
      expect(restaurantCustomerReviewModel.name, equals(""));
      expect(restaurantCustomerReviewModel.review, equals(""));
      expect(restaurantCustomerReviewModel.date, equals(""));
    });
  });
}
