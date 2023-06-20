import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class DatabaseLoading extends DatabaseState {}

class DatabaseHasData extends DatabaseState {
  final List<RestaurantSummaryEntity> favoriteRestaurants;

  DatabaseHasData(this.favoriteRestaurants);
}

class DatabaseNoData extends DatabaseState {
  final String message;

  DatabaseNoData(this.message);
}

class DatabaseError extends DatabaseState {
  final String message;

  DatabaseError(this.message);
}
