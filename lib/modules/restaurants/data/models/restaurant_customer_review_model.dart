import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

class RestaurantCustomerReviewModel extends RestaurantCustomerReviewEntity {
  RestaurantCustomerReviewModel.fromJson(Map<String, dynamic> json)
      : super(
          date: json["date"] ?? "",
          name: json["name"] ?? "",
          review: json["review"] ?? "",
        );
}
