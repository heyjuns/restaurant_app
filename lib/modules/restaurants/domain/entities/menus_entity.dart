import 'menu_entity.dart';

class MenusEntity {
  final List<MenuEntity> foods;
  final List<MenuEntity> drinks;

  MenusEntity({
    required this.foods,
    required this.drinks,
  });

  factory MenusEntity.fromJson(Map<String, dynamic> json) => MenusEntity(
        foods: List<MenuEntity>.from(
            json["foods"].map((x) => MenuEntity.fromJson(x))),
        drinks: List<MenuEntity>.from(
            json["drinks"].map((x) => MenuEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
