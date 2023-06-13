import 'dart:convert';
import 'dart:io';

import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_add_review_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_detail_model.dart';
import 'package:restaurant_app/modules/restaurants/data/models/response_restaurant_list_model.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_list_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_detail_entity.dart';

import 'package:restaurant_app/modules/restaurants/domain/entities/response_restaurant_add_review_entity.dart';
import 'package:restaurant_app/utils/utils.dart';
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
    } on SocketException catch (e) {
      throw Exception(e.message);
    }

    throw Exception('something went wrong when getListOfRestaurant');
  }

  @override
  Future<ResponseRestaurantListEntity> getRestaurantBySearch(
      String searchTerm) async {
    const endPoint = '/search';

    try {
      var response =
          await http.get(Uri.parse('$baseUrl/$endPoint?q=$searchTerm'));

      if (response.statusCode == 200) {
        return ResponseRestaurantListModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException catch (e) {
      throw Exception(e.message);
    }

    throw Exception(
        'something went wrong when getRestaurantBySearch $searchTerm');
  }

  @override
  Future<ResponseRestaurantDetailEntity> getRestaurantDetail(String id) async {
    const endPoint = 'detail';

    try {
      var response = await http.get(Uri.parse('$baseUrl/$endPoint/$id'));

      if (response.statusCode == 200) {
        return ResponseRestaurantDetailModel.fromJson(
            jsonDecode(response.body));
      }
    } on SocketException catch (e) {
      throw Exception(e.message);
    }

    throw Exception('something went wrong when getRestaurantDetail $id');
  }

  @override
  Future<ResponseRestaurantAddReviewEntity> postRestaurantReview(
      String id, String name, String review) async {
    const endPoint = 'review';
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/$endPoint'),
        body: jsonEncode({
          "id": id,
          "name": name,
          "review": review,
        }),
        headers: headers,
      );
      if (response.statusCode == 201) {
        return ResponseRestaurantAddReviewModel.fromJson(
            jsonDecode(response.body));
      }
    } on SocketException catch (e) {
      throw Exception(e.message);
    }

    throw Exception('something went wrong when postRestaurantReview $id');
  }
}
