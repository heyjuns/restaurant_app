import 'package:equatable/equatable.dart';

import 'name_entity.dart';

class MenuListEntity extends Equatable {
  final List<NameEntity> foods;
  final List<NameEntity> drinks;

  const MenuListEntity({
    required this.foods,
    required this.drinks,
  });

  @override
  List<Object?> get props => [
        foods,
        drinks,
      ];
}
