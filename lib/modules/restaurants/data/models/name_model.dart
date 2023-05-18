import '../../domain/entities/name_entity.dart';

class NameModel extends NameEntity {
  NameModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json["name"] ?? "",
        );
}
