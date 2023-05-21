import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';

abstract class RestaurantDetailState {}

class RestaurantDetailInitState extends RestaurantDetailState {}

class RestaurantDetailNoInternetState extends RestaurantDetailState {}

class RestaurantDetailLoadedState extends RestaurantDetailState {
  final RestaurantDetailEntity restaurant;

  RestaurantDetailLoadedState({required this.restaurant});
}

class RestaurantDetailLoadingState extends RestaurantDetailState {}

class RestaurantDetailErrorState extends RestaurantDetailState {
  late final String errorMessage;
  RestaurantDetailErrorState(this.errorMessage);
}
