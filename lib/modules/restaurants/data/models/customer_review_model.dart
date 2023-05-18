import 'package:restaurant_app/modules/restaurants/domain/entities/customer_review_entity.dart';

class CustomerReviewModel extends CustomerReviewEntity {
  CustomerReviewModel.fromJson(Map<String, dynamic> json)
      : super(
          date: json["date"] ?? "",
          name: json["name"] ?? "",
          review: json["review"] ?? "",
        );
}
