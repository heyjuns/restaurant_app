import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/menu_list_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

void main() {
  group('RestaurantDetailEntity', () {
    test('should create a RestaurantDetailEntity instance', () {
      // Arrange
      const id = '1';
      const name = 'Restaurant 1';
      const description = 'Restaurant 1 description';
      const pictureId = '1.jpg';
      const city = 'City 1';
      const rating = 4.2;
      final categories = [
        NameEntity(name: 'Category 1'),
        NameEntity(name: 'Category 2'),
      ];
      final menus = MenuListEntity(
        foods: [
          NameEntity(name: 'Food 1'),
          NameEntity(name: 'Food 2'),
        ],
        drinks: [
          NameEntity(name: 'Drink 1'),
          NameEntity(name: 'Drink 2'),
        ],
      );
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
      final entity = RestaurantDetailEntity(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
        categories: categories,
        menus: menus,
        customerReviews: customerReviews,
      );

      // Assert
      expect(entity.id, equals(id));
      expect(entity.name, equals(name));
      expect(entity.description, equals(description));
      expect(entity.pictureId, equals(pictureId));
      expect(entity.city, equals(city));
      expect(entity.rating, equals(rating));
      expect(entity.categories, equals(categories));
      expect(entity.menus, equals(menus));
      expect(entity.customerReviews, equals(customerReviews));
    });
  });
}
