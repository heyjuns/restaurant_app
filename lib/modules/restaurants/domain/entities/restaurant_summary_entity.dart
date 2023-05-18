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
}
