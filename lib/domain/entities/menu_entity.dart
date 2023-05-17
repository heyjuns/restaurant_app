class MenuEntity {
  final String name;

  MenuEntity({
    required this.name,
  });

  factory MenuEntity.fromJson(Map<String, dynamic> json) => MenuEntity(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
