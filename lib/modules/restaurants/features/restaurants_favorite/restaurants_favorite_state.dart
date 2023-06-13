// restaurants_favorite_event.dart
abstract class RestaurantsFavoriteEvent {}

class ToggleFavoriteEvent extends RestaurantsFavoriteEvent {
  final int restaurantId;

  ToggleFavoriteEvent(this.restaurantId);
}

abstract class RestaurantsFavoriteState {}

class RestaurantsFavoriteInitialState extends RestaurantsFavoriteState {}

class FavoriteToggledState extends RestaurantsFavoriteState {
  final int restaurantId;
  final bool isFavorite;

  FavoriteToggledState(this.restaurantId, this.isFavorite);
}
