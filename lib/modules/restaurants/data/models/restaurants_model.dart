import 'package:restaurant_app/modules/restaurants/data/models/restaurant_model.dart';

import '../../domain/entities/restaurant_entity.dart';
import '../../domain/entities/restaurants_entity.dart';

class RestaurantsModel extends RestaurantsEntity {
  RestaurantsModel.fromJson(Map<String, dynamic> json)
      : super(
          restaurants: List<RestaurantEntity>.from(
            json["restaurants"].map(
              (item) => RestaurantModel.fromJson(json),
            ),
          ),
        );
}
