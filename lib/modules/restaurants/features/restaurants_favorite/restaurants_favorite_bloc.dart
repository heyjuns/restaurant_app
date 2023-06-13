import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurants_favorite/restaurants_favorite_state.dart';
import 'package:restaurant_app/utils/database_helper.dart';

class RestaurantsFavoriteBloc
    extends Bloc<RestaurantsFavoriteEvent, RestaurantsFavoriteState> {
  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  RestaurantsFavoriteBloc() : super(RestaurantsFavoriteInitialState());

  Stream<RestaurantsFavoriteState> mapEventToState(
      RestaurantsFavoriteEvent event) async* {
    if (event is ToggleFavoriteEvent) {
      final int restaurantId = event.restaurantId;
      final bool isFavorite =
          await databaseHelper.isFavoriteRestaurant(restaurantId.toString());

      if (isFavorite) {
        await databaseHelper.deleteFavoriteRestaurant(restaurantId.toString());
      } else {
        final restaurant = RestaurantSummaryEntity(
          id: restaurantId.toString(),
          name: 'Restaurant $restaurantId',
          description: 'Description $restaurantId',
          pictureId: 'picture_$restaurantId',
          city: 'City $restaurantId',
          rating: 4.5,
        );
        await databaseHelper.insertFavoriteRestaurant(restaurant);
      }

      yield FavoriteToggledState(restaurantId, !isFavorite);
    }
  }
}
