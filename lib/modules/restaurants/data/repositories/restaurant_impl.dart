import 'dart:convert';

import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_list_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';
import 'package:restaurant_app/utils.dart';

import '../../domain/repositories/restaurant_repository.dart';
import 'package:http/http.dart' as http;

class RestaurantImpl extends RestaurantRepository {
  static const baseUrl = Utils.baseUrl;

  @override
  Future<ResponseRestaurantListEntity> getListOfRestaurant() async {
    const endPoint = 'list';

    try {
      var response = await http.get(Uri.parse('$baseUrl/$endPoint'));

      if (response.statusCode == 200) {
        return ResponseRestaurantListModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('failed to fetch restaurant list: $e');
    }

    throw Exception('something went wrong');
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
