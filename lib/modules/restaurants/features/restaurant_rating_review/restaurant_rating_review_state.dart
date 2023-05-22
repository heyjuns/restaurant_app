abstract class RestaurantRatingReviewState {}

class RestaurantRatingReviewInitState extends RestaurantRatingReviewState {}

class RestaurantRatingReviewNoInternetState
    extends RestaurantRatingReviewState {}

class RestaurantRatingReviewLoadedState extends RestaurantRatingReviewState {}

class RestaurantRatingReviewLoadingState extends RestaurantRatingReviewState {}

class RestaurantRatingReviewErrorState extends RestaurantRatingReviewState {
  late final String errorMessage;
  RestaurantRatingReviewErrorState(this.errorMessage);
}
