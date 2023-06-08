import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/menus_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/name_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';

void main() {
  group('MenuListModel', () {
    test('should create a MenuListModel instance from JSON', () {
      // Arrange
      final json = {
        "drinks": [
          {"name": "Drink 1"},
          {"name": "Drink 2"},
        ],
        "foods": [
          {"name": "Food 1"},
          {"name": "Food 2"},
        ]
      };

      // Act
      final menuListModel = MenuListModel.fromJson(json);

      // Assert
      expect(menuListModel, isA<MenuListModel>());
      expect(menuListModel.drinks, isA<List<NameEntity>>());
      expect(menuListModel.drinks.length, equals(2));
      expect(menuListModel.drinks[0], isA<NameModel>());
      expect(menuListModel.drinks[0].name, equals("Drink 1"));
      expect(menuListModel.drinks[1].name, equals("Drink 2"));

      expect(menuListModel.foods, isA<List<NameEntity>>());
      expect(menuListModel.foods.length, equals(2));
      expect(menuListModel.foods[0], isA<NameModel>());
      expect(menuListModel.foods[0].name, equals("Food 1"));
      expect(menuListModel.foods[1].name, equals("Food 2"));
    });
  });
}
