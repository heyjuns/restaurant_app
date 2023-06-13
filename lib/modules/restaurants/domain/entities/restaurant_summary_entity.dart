class RestaurantSummaryEntity {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;

  RestaurantSummaryEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pictureId': pictureId,
      'city': city,
      'rating': rating,
    };
  }

  static RestaurantSummaryEntity fromMap(Map<String, dynamic> map) {
    return RestaurantSummaryEntity(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      pictureId: map['pictureId'],
      city: map['city'],
      rating: map['rating'],
    );
  }
}
