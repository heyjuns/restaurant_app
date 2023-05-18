import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'menus_entity.dart';

class RestaurantDetailEntity {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final List<NameEntity> categories;
  final MenusEntity menus;
  final List<RestaurantCustomerReviewEntity> customerReviews;

  RestaurantDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
    required this.categories,
    required this.customerReviews,
  });
}
