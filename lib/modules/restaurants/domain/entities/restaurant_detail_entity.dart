import 'package:equatable/equatable.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';
import 'menu_list_entity.dart';

class RestaurantDetailEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final List<NameEntity> categories;
  final MenuListEntity menus;
  final List<RestaurantCustomerReviewEntity> customerReviews;

  const RestaurantDetailEntity({
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

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pictureId,
        city,
        rating,
        menus,
        categories,
        customerReviews,
      ];
}
