import 'package:restaurant_app/modules/restaurants/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';

class ResponseRestaurantDetailModel extends ResponseRestaurantDetailEntity {
  ResponseRestaurantDetailModel.fromJson(Map<String, dynamic> json)
      : super(
          error: json["error"] ?? false,
          message: json["message"] ?? "",
          restaurant: RestaurantDetailModel.fromJson(json["restaurant"]),
        );
}
