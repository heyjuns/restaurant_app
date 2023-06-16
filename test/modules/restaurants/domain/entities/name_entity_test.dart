import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';

void main() {
  group('NameEntity', () {
    test('should create a NameEntity instance', () {
      // Arrange
      const name = 'John Doe';

      // Act
      const nameEntity = NameEntity(name: name);

      // Assert
      expect(nameEntity.name, equals(name));
    });
  });
}
