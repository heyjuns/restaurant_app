import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

class RestaurantSummaryModel extends RestaurantSummaryEntity {
  RestaurantSummaryModel.fromJson(Map<String, dynamic> json)
      : super(
          city: json["city"] ?? "",
          description: json["description"] ?? "",
          id: json["id"] ?? "",
          name: json["name"] ?? "",
          pictureId: json["pictureId"] ?? "",
          rating: json["rating"] ?? 0.0,
        );
}
