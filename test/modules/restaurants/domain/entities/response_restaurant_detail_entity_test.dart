import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/menu_list_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';

void main() {
  group('ResponseRestaurantDetailEntity', () {
    test('should create a ResponseRestaurantDetailEntity instance', () {
      // Arrange
      const error = false;
      const message = 'Restaurant detail retrieved successfully';
      const restaurant = RestaurantDetailEntity(
        id: '1',
        name: 'Restaurant 1',
        description: 'Restaurant 1 description',
        pictureId: '1.jpg',
        city: 'City 1',
        rating: 4.2,
        categories: [
          NameEntity(name: 'Category 1'),
          NameEntity(name: 'Category 2'),
        ],
        menus: MenuListEntity(
          foods: [
            NameEntity(name: 'Food 1'),
            NameEntity(name: 'Food 2'),
          ],
          drinks: [
            NameEntity(name: 'Drink 1'),
            NameEntity(name: 'Drink 2'),
          ],
        ),
        customerReviews: [
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
        ],
      );

      // Act
      const responseEntity = ResponseRestaurantDetailEntity(
        error: error,
        message: message,
        restaurant: restaurant,
      );

      // Assert
      expect(responseEntity.error, equals(error));
      expect(responseEntity.message, equals(message));
      expect(responseEntity.restaurant, equals(restaurant));
    });
  });
}
