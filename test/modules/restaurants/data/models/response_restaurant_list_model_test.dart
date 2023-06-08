import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_list_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

void main() {
  group('ResponseRestaurantListModel', () {
    test('should create a ResponseRestaurantListModel instance from JSON', () {
      // Arrange
      final json = {
        "count": 5,
        "error": false,
        "message": "Restaurant list retrieved successfully",
        "restaurants": [
          {
            "id": "1",
            "name": "Restaurant A",
            "description": "Description A",
            "pictureId": "1",
            "city": "City A",
            "rating": 4.5
          },
          {
            "id": "2",
            "name": "Restaurant B",
            "description": "Description B",
            "pictureId": "2",
            "city": "City B",
            "rating": 4.0
          },
          {
            "id": "3",
            "name": "Restaurant C",
            "description": "Description C",
            "pictureId": "3",
            "city": "City C",
            "rating": 3.5
          },
          {
            "id": "4",
            "name": "Restaurant D",
            "description": "Description D",
            "pictureId": "4",
            "city": "City D",
            "rating": 4.8
          },
          {
            "id": "5",
            "name": "Restaurant E",
            "description": "Description E",
            "pictureId": "5",
            "city": "City E",
            "rating": 4.2
          }
        ]
      };

      // Act
      final responseRestaurantListModel =
          ResponseRestaurantListModel.fromJson(json);

      // Assert
      expect(responseRestaurantListModel, isA<ResponseRestaurantListModel>());
      expect(responseRestaurantListModel.count, equals(5));
      expect(responseRestaurantListModel.error, equals(false));
      expect(responseRestaurantListModel.message,
          equals("Restaurant list retrieved successfully"));
      expect(responseRestaurantListModel.restaurants,
          isA<List<RestaurantSummaryEntity>>());
      expect(responseRestaurantListModel.restaurants.length, equals(5));
      expect(responseRestaurantListModel.restaurants[0],
          isA<RestaurantSummaryModel>());
      expect(responseRestaurantListModel.restaurants[0].id, equals("1"));
      expect(responseRestaurantListModel.restaurants[0].name,
          equals("Restaurant A"));
      expect(responseRestaurantListModel.restaurants[0].description,
          equals("Description A"));
      expect(responseRestaurantListModel.restaurants[0].pictureId, equals("1"));
      expect(responseRestaurantListModel.restaurants[0].city, equals("City A"));
      expect(responseRestaurantListModel.restaurants[0].rating, equals(4.5));
      // Add more assertions for the other elements in the list
    });
  });
}
