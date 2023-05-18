abstract class RestaurantsState {}

class RestaurantsInitState extends RestaurantsState {}

class RestaurantsNoInternetState extends RestaurantsState {}

class RestaurantsLoadedState extends RestaurantsState {}

class RestaurantsLoadingState extends RestaurantsState {}

class RestaurantsErrorState extends RestaurantsState {
  late final String errorMessage;
  RestaurantsErrorState(this.errorMessage);
}
