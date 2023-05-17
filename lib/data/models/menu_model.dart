import 'package:restaurant_app/domain/entities/menu_entity.dart';

class MenuModel extends MenuEntity {
  MenuModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json["name"] ?? "",
        );
}
