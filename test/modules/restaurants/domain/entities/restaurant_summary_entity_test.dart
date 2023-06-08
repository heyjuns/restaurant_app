import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

void main() {
  group('RestaurantSummaryEntity', () {
    test('should create a RestaurantSummaryEntity instance', () {
      // Arrange
      const id = '123';
      const name = 'Restaurant XYZ';
      const description = 'A wonderful restaurant';
      const pictureId = 'abc123';
      const city = 'New York';
      const rating = 4.5;

      // Act
      final summaryEntity = RestaurantSummaryEntity(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
      );

      // Assert
      expect(summaryEntity.id, equals(id));
      expect(summaryEntity.name, equals(name));
      expect(summaryEntity.description, equals(description));
      expect(summaryEntity.pictureId, equals(pictureId));
      expect(summaryEntity.city, equals(city));
      expect(summaryEntity.rating, equals(rating));
    });
  });
}
