import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';

void main() {
  group('ResponseRestaurantListEntity', () {
    test('should create a ResponseRestaurantListEntity instance', () {
      // Arrange
      const error = false;
      const message = 'Restaurant list retrieved successfully';
      const count = 5;
      const restaurants = [
        RestaurantSummaryEntity(
          id: '1',
          name: 'Restaurant 1',
          description: 'Restaurant 1 description',
          pictureId: '1.jpg',
          city: 'City 1',
          rating: 4.2,
        ),
        RestaurantSummaryEntity(
          id: '2',
          name: 'Restaurant 2',
          description: 'Restaurant 2 description',
          pictureId: '2.jpg',
          city: 'City 2',
          rating: 4.5,
        ),
      ];

      // Act
      const responseEntity = ResponseRestaurantListEntity(
        error: error,
        message: message,
        count: count,
        restaurants: restaurants,
      );

      // Assert
      expect(responseEntity.error, equals(error));
      expect(responseEntity.message, equals(message));
      expect(responseEntity.count, equals(count));
      expect(responseEntity.restaurants, equals(restaurants));
    });
  });
}
