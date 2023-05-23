import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_customer_review_entity.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';

import 'restaurant_rating_review_state.dart';

class RestaurantRatingReviewCubit extends Cubit<RestaurantRatingReviewState> {
  late RestaurantImpl restaurantImpl;

  late RestaurantDetailEntity restaurant;
  List<RestaurantCustomerReviewEntity> customerReviews = [];
  RestaurantRatingReviewCubit({
    required this.restaurantImpl,
  }) : super(RestaurantRatingReviewInitState());

  Future<void> postRestaurantReview(
      String id, String name, String review) async {
    emit(RestaurantRatingReviewLoadingState());
    try {
      var result = await restaurantImpl.postRestaurantReview(id, name, review);
      if (result.error == false) {
        updateCustomerReviews(result.customerReviews);
      } else {
        emit(RestaurantRatingReviewErrorState(result.message));
      }
    } catch (e) {
      emit(RestaurantRatingReviewNoInternetState());
    }
  }

  updateCustomerReviews(List<RestaurantCustomerReviewEntity> data) {
    emit(RestaurantRatingReviewLoadingState());
    customerReviews = data;
    emit(RestaurantRatingReviewLoadedState());
  }
}
