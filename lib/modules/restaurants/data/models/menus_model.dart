import '../../domain/entities/menu_entity.dart';
import '../../domain/entities/menus_entity.dart';
import 'menu_model.dart';

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
