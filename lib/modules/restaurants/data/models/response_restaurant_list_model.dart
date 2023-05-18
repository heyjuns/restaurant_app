import 'package:restaurant_app/modules/restaurants/data/models/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class ResponseRestaurantListModel extends ResponseRestaurantListEntity {
  ResponseRestaurantListModel.fromJson(Map<String, dynamic> json)
      : super(
          count: json["count"] ?? 0,
          error: json["error"] ?? false,
          message: json["message"] ?? "",
          restaurants: List<RestaurantSummaryEntity>.from(
            json["restaurants"].map(
              (item) => RestaurantSummaryModel.fromJson(item),
            ),
          ),
        );
}
