import 'package:restaurant_app/data/models/menu_model.dart';
import 'package:restaurant_app/domain/entities/menu_entity.dart';
import 'package:restaurant_app/domain/entities/menus_entity.dart';

class MenusModel extends MenusEntity {
  MenusModel.fromJson(Map<String, dynamic> json)
      : super(
          drinks: List<MenuEntity>.from(
            json["drinks"].map(
              (item) => MenuModel.fromJson(item),
            ),
          ),
          foods: List<MenuEntity>.from(
            json["foods"].map(
              (item) => MenuModel.fromJson(item),
            ),
          ),
        );
}
