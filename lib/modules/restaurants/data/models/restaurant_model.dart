import '../../domain/entities/menus_entity.dart';
import '../../domain/entities/restaurant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel.fromJson(Map<String, dynamic> json)
      : super(
          city: json["city"] ?? "",
          description: json["description"] ?? "",
          id: json["id"] ?? "",
          name: json["name"] ?? "",
          pictureId: json["pictureId"] ?? "",
          rating: json["rating"] ?? 0.0,
          menus: MenusEntity.fromJson(json["menus"]),
        );
}
