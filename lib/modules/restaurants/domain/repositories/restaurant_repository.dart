import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';

abstract class RestaurantRepository {
  Future<ResponseRestaurantListEntity> getListOfRestaurant();
  Future<ResponseRestaurantDetailEntity> getRestaurantDetail(String id);
  Future<ResponseRestaurantListEntity> getRestaurantBySearch(String searchTerm);
  // Future<dynamic> getRestaurantImage(String size, String pictureId);
  Future<ResponseRestaurantAddReviewEntity> postRestaurantReview(
      String id, String name, String review);
}
