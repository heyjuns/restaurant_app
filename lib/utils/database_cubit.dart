import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'package:restaurant_app/utils/database_helper.dart';
import 'package:restaurant_app/utils/database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  final DatabaseHelper databaseHelper;
  late List<RestaurantSummaryEntity> favoriteRestaurants = [];
  DatabaseCubit({required this.databaseHelper}) : super(DatabaseInitial()) {
    getFavoriteRestaurants();
  }
  void getFavoriteRestaurants() async {
    emit(DatabaseLoading());

    try {
      final response = await databaseHelper.getFavoriteRestaurants();
      if (response.isNotEmpty) {
        favoriteRestaurants = response;
        emit(DatabaseHasData(response));
      } else {
        favoriteRestaurants = [];
        emit(DatabaseNoData('Empty Data'));
      }
    } catch (e) {
      emit(DatabaseError('Error: $e'));
    }
  }

  void addFavoriteRestaurant(restaurant) async {
    emit(DatabaseLoading());

    try {
      await databaseHelper.insertFavoriteRestaurant(restaurant);
      getFavoriteRestaurants();
    } catch (e) {
      emit(DatabaseError('Error: $e'));
    }
  }

  Future<bool> isFavoriteRestaurant(String id) async {
    emit(DatabaseLoading());

    final result = await databaseHelper.isFavoriteRestaurant(id);
    return result;
  }

  void removeFavoriteRestaurant(String id) async {
    emit(DatabaseLoading());

    try {
      await databaseHelper.deleteFavoriteRestaurant(id);
      getFavoriteRestaurants();
    } catch (e) {
      emit(DatabaseError('Error: $e'));
    }
  }
}
