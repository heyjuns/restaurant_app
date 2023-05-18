import 'package:restaurant_app/modules/restaurants/data/models/restaurant_customer_review_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';

class ResponseRestaurantAddReviewModel
    extends ResponseRestaurantAddReviewEntity {
  ResponseRestaurantAddReviewModel.fromJson(Map<String, dynamic> json)
      : super(
          message: json["message"] ?? "",
          error: json["error"] ?? false,
          customerReviews: List<RestaurantCustomerReviewEntity>.from(
              json["customerReviews"].map(
            (item) => RestaurantCustomerReviewModel.fromJson(item),
          )),
        );
}
