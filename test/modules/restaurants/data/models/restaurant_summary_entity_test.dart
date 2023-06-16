import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

void main() {
  group('RestaurantSummaryEntity', () {
    test('should create a RestaurantSummaryEntity instance', () {
      // Arrange
      const id = '1';
      const name = 'Restaurant 1';
      const description = 'Restaurant 1 description';
      const pictureId = '1.jpg';
      const city = 'City 1';
      const rating = 4.2;

      // Act
      RestaurantSummaryEntity restaurantSummaryEntity =
          const RestaurantSummaryEntity(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
      );

      // Assert
      expect(restaurantSummaryEntity.id, equals(id));
      expect(restaurantSummaryEntity.name, equals(name));
      expect(restaurantSummaryEntity.description, equals(description));
      expect(restaurantSummaryEntity.pictureId, equals(pictureId));
      expect(restaurantSummaryEntity.city, equals(city));
      expect(restaurantSummaryEntity.rating, equals(rating));
    });
  });
}
