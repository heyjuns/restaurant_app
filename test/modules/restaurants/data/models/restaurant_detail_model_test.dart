import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/menus_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/name_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_customer_review_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_detail_model.dart';

void main() {
  group('RestaurantDetailModel', () {
    test('should create a RestaurantDetailModel instance from JSON', () {
      // Arrange
      final json = {
        "city": "City A",
        "description": "Description A",
        "id": "1",
        "name": "Restaurant A",
        "pictureId": "1",
        "rating": 4.5,
        "categories": [
          {"name": "Category A"},
          {"name": "Category B"},
          {"name": "Category C"}
        ],
        "menus": {
          "drinks": [
            {"name": "Drink A"},
            {"name": "Drink B"}
          ],
          "foods": [
            {"name": "Food A"},
            {"name": "Food B"}
          ]
        },
        "customerReviews": [
          {"name": "Customer A", "review": "Review A", "date": "2023-01-01"},
          {"name": "Customer B", "review": "Review B", "date": "2023-01-02"}
        ]
      };

      // Act
      final restaurantDetailModel = RestaurantDetailModel.fromJson(json);

      // Assert
      expect(restaurantDetailModel, isA<RestaurantDetailModel>());
      expect(restaurantDetailModel.city, equals("City A"));
      expect(restaurantDetailModel.description, equals("Description A"));
      expect(restaurantDetailModel.id, equals("1"));
      expect(restaurantDetailModel.name, equals("Restaurant A"));
      expect(restaurantDetailModel.pictureId, equals("1"));
      expect(restaurantDetailModel.rating, equals(4.5));
      expect(restaurantDetailModel.categories, isA<List<NameEntity>>());
      expect(restaurantDetailModel.categories.length, equals(3));
      expect(restaurantDetailModel.categories[0], isA<NameModel>());
      expect(restaurantDetailModel.categories[0].name, equals("Category A"));
      expect(restaurantDetailModel.menus, isA<MenuListModel>());
      expect(restaurantDetailModel.menus.drinks, isA<List<NameEntity>>());
      expect(restaurantDetailModel.menus.drinks.length, equals(2));
      expect(restaurantDetailModel.menus.drinks[0], isA<NameModel>());
      expect(restaurantDetailModel.menus.drinks[0].name, equals("Drink A"));
      expect(restaurantDetailModel.menus.foods, isA<List<NameEntity>>());
      expect(restaurantDetailModel.menus.foods.length, equals(2));
      expect(restaurantDetailModel.menus.foods[0], isA<NameModel>());
      expect(restaurantDetailModel.menus.foods[0].name, equals("Food A"));
      expect(restaurantDetailModel.customerReviews,
          isA<List<RestaurantCustomerReviewEntity>>());
      expect(restaurantDetailModel.customerReviews.length, equals(2));
      expect(restaurantDetailModel.customerReviews[0],
          isA<RestaurantCustomerReviewModel>());
      expect(
          restaurantDetailModel.customerReviews[0].name, equals("Customer A"));
      expect(
          restaurantDetailModel.customerReviews[0].review, equals("Review A"));
      expect(
          restaurantDetailModel.customerReviews[0].date, equals("2023-01-01"));
    });
  });
}
