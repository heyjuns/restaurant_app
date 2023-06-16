import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/menu_list_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';

void main() {
  group('MenuListEntity', () {
    test('should create a MenuListEntity instance', () {
      // Arrange
      const foods = [
        NameEntity(name: 'Pizza'),
        NameEntity(name: 'Burger'),
      ];
      const drinks = [
        NameEntity(name: 'Coke'),
        NameEntity(name: 'Sprite'),
      ];

      // Act
      const menuListEntity = MenuListEntity(foods: foods, drinks: drinks);

      // Assert
      expect(menuListEntity.foods, equals(foods));
      expect(menuListEntity.drinks, equals(drinks));
    });
  });
}
