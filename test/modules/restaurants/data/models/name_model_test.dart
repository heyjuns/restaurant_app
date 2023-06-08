import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/name_model.dart';

void main() {
  group('NameModel', () {
    test('should create a NameModel instance from JSON', () {
      // Arrange
      final json = {"name": "John Doe"};

      // Act
      final nameModel = NameModel.fromJson(json);

      // Assert
      expect(nameModel, isA<NameModel>());
      expect(nameModel.name, equals("John Doe"));
    });
  });
}
