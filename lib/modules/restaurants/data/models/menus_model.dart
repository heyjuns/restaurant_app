import '../../domain/entities/name_entity.dart';
import '../../domain/entities/menus_entity.dart';
import 'name_model.dart';

class MenusModel extends MenusEntity {
  MenusModel.fromJson(Map<String, dynamic> json)
      : super(
          drinks: List<NameEntity>.from(
            json["drinks"].map(
              (item) => NameModel.fromJson(item),
            ),
          ),
          foods: List<NameEntity>.from(
            json["foods"].map(
              (item) => NameModel.fromJson(item),
            ),
          ),
        );
}
