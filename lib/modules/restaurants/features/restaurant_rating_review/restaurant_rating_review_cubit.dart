import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';

import 'restaurant_rating_review_state.dart';

class RestaurantRatingReviewCubit extends Cubit<RestaurantRatingReviewState> {
  late RestaurantImpl restaurantImpl;
  RestaurantRatingReviewCubit({
    required this.restaurantImpl,
  }) : super(RestaurantRatingReviewInitState());

  Future<void> postRestaurantReview(
      String id, String name, String review) async {
    emit(RestaurantRatingReviewLoadingState());
    var result = await restaurantImpl.postRestaurantReview(id, name, review);
    if (result.error == false) {
      emit(RestaurantRatingReviewLoadedState());
    } else {
      emit(RestaurantRatingReviewErrorState(result.message));
    }
  }
}
