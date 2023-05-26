import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'menu_list_entity.dart';

class RestaurantDetailEntity {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final List<NameEntity> categories;
  final MenuListEntity menus;
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
