import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_customer_review_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_add_review_model.dart';

void main() {
  group('ResponseRestaurantAddReviewModel', () {
    test('should create a ResponseRestaurantAddReviewModel instance from JSON',
        () {
      // Arrange
      final json = {
        "message": "Review added successfully",
        "error": false,
        "customerReviews": [
          {
            "name": "John Doe",
            "review": "Great restaurant",
            "date": "2022-01-01"
          },
          {
            "name": "Jane Smith",
            "review": "Nice atmosphere",
            "date": "2022-02-01"
          }
        ]
      };

      // Act
      final responseRestaurantAddReviewModel =
          ResponseRestaurantAddReviewModel.fromJson(json);

      // Assert
      expect(responseRestaurantAddReviewModel,
          isA<ResponseRestaurantAddReviewModel>());
      expect(responseRestaurantAddReviewModel.message,
          equals("Review added successfully"));
      expect(responseRestaurantAddReviewModel.error, equals(false));
      expect(responseRestaurantAddReviewModel.customerReviews,
          isA<List<RestaurantCustomerReviewEntity>>());
      expect(
          responseRestaurantAddReviewModel.customerReviews.length, equals(2));
      expect(responseRestaurantAddReviewModel.customerReviews[0],
          isA<RestaurantCustomerReviewModel>());
      expect(responseRestaurantAddReviewModel.customerReviews[0].name,
          equals("John Doe"));
      expect(responseRestaurantAddReviewModel.customerReviews[0].review,
          equals("Great restaurant"));
      expect(responseRestaurantAddReviewModel.customerReviews[0].date,
          equals("2022-01-01"));
      expect(responseRestaurantAddReviewModel.customerReviews[1],
          isA<RestaurantCustomerReviewModel>());
      expect(responseRestaurantAddReviewModel.customerReviews[1].name,
          equals("Jane Smith"));
      expect(responseRestaurantAddReviewModel.customerReviews[1].review,
          equals("Nice atmosphere"));
      expect(responseRestaurantAddReviewModel.customerReviews[1].date,
          equals("2022-02-01"));
    });
  });
}
