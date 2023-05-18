import 'dart:convert';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';

import '../../domain/repositories/restaurant_repository.dart';
import 'package:http/http.dart' as http;

class RestaurantImpl extends RestaurantRepository {
  static const baseUrl = 'https://restaurant-api.dicoding.dev';
  @override
  Future<ResponseRestaurantListEntity> getListOfRestaurant() async {
    const endPoint = 'list';

    var response = await http.get(Uri.parse('$baseUrl/$endPoint'));
    print(response);
    return jsonDecode(response.body);
  }

  @override
  Future<ResponseRestaurantListEntity> getRestaurantBySearch(
      String searchTerm) {
    // TODO: implement getRestaurantBySearch
    throw UnimplementedError();
  }

  @override
  Future<ResponseRestaurantDetailEntity> getRestaurantDetail(int id) {
    // TODO: implement getRestaurantDetail
    throw UnimplementedError();
  }

  @override
  Future<ResponseRestaurantAddReviewEntity> postRestaurantReview(
      String id, String name, String review) {
    // TODO: implement postRestaurantReview
    throw UnimplementedError();
  }
}
