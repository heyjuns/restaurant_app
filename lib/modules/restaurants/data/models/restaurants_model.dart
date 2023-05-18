import 'package:restaurant_app/modules/restaurants/data/models/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

import '../../domain/entities/restaurants_entity.dart';

class RestaurantsModel extends RestaurantsEntity {
  RestaurantsModel.fromJson(Map<String, dynamic> json)
      : super(
          restaurants: List<RestaurantSummaryEntity>.from(
            json["restaurants"].map(
              (item) => RestaurantSummaryModel.fromJson(json),
            ),
          ),
        );
}
