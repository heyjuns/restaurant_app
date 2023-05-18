import 'package:restaurant_app/modules/restaurants/data/models/customer_review_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/menus_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/name_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/name_entity.dart';

import '../../domain/entities/restaurant_detail_entity.dart';

class RestaurantDetailModel extends RestaurantDetailEntity {
  RestaurantDetailModel.fromJson(Map<String, dynamic> json)
      : super(
            city: json["city"] ?? "",
            description: json["description"] ?? "",
            id: json["id"] ?? "",
            name: json["name"] ?? "",
            pictureId: json["pictureId"] ?? "",
            rating: json["rating"] ?? 0.0,
            categories: List<NameEntity>.from(json["categories"].map(
              (item) => NameModel.fromJson(json),
            )),
            menus: MenusModel.fromJson(json["menus"]),
            customerReviews:
                List<CustomerReviewEntity>.from(json["customerReviews"].map(
              (item) => CustomerReviewModel.fromJson(item),
            )));
}
