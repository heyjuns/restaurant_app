import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/menus_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_detail_model.dart';

void main() {
  group('ResponseRestaurantDetailModel', () {
    test('should create a ResponseRestaurantDetailModel instance from JSON',
        () {
      // Arrange
      final json = {
        "error": false,
        "message": "Success",
        "restaurant": {
          "id": "1",
          "name": "Restaurant 1",
          "description": "Restaurant 1 description",
          "pictureId": "1.jpg",
          "city": "City 1",
          "rating": 4.2,
          "categories": [
            {"name": "Category 1"},
            {"name": "Category 2"}
          ],
          "menus": {
            "drinks": [
              {"name": "Drink 1"},
              {"name": "Drink 2"}
            ],
            "foods": [
              {"name": "Food 1"},
              {"name": "Food 2"}
            ]
          },
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
        }
      };

      // Act
      final responseRestaurantDetailModel =
          ResponseRestaurantDetailModel.fromJson(json);

      // Assert
      expect(
          responseRestaurantDetailModel, isA<ResponseRestaurantDetailModel>());
      expect(responseRestaurantDetailModel.error, equals(false));
      expect(responseRestaurantDetailModel.message, equals("Success"));
      expect(responseRestaurantDetailModel.restaurant,
          isA<RestaurantDetailModel>());
      expect(responseRestaurantDetailModel.restaurant.id, equals("1"));
      expect(responseRestaurantDetailModel.restaurant.name,
          equals("Restaurant 1"));
      expect(responseRestaurantDetailModel.restaurant.description,
          equals("Restaurant 1 description"));
      expect(
          responseRestaurantDetailModel.restaurant.pictureId, equals("1.jpg"));
      expect(responseRestaurantDetailModel.restaurant.city, equals("City 1"));
      expect(responseRestaurantDetailModel.restaurant.rating, equals(4.2));
      expect(responseRestaurantDetailModel.restaurant.categories,
          isA<List<NameEntity>>());
      expect(responseRestaurantDetailModel.restaurant.categories.length,
          equals(2));
      expect(
          responseRestaurantDetailModel.restaurant.menus, isA<MenuListModel>());
      expect(responseRestaurantDetailModel.restaurant.menus.drinks,
          isA<List<NameEntity>>());
      expect(responseRestaurantDetailModel.restaurant.menus.drinks.length,
          equals(2));
      expect(responseRestaurantDetailModel.restaurant.menus.foods,
          isA<List<NameEntity>>());
      expect(responseRestaurantDetailModel.restaurant.menus.foods.length,
          equals(2));
      expect(responseRestaurantDetailModel.restaurant.customerReviews,
          isA<List<RestaurantCustomerReviewEntity>>());
      expect(responseRestaurantDetailModel.restaurant.customerReviews.length,
          equals(2));
    });
  });
}
