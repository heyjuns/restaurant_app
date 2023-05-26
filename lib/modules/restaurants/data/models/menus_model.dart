import '../../domain/entities/name_entity.dart';
import '../../domain/entities/menu_list_entity.dart';
import 'name_model.dart';

class MenuListModel extends MenuListEntity {
  MenuListModel.fromJson(Map<String, dynamic> json)
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
