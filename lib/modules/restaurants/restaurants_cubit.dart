import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  final RestaurantImpl restaurantImpl;
  RestaurantsCubit({
    required this.restaurantImpl,
  }) : super(RestaurantsInitState());

  Future<void> getRestaurantList() {
    emit(RestaurantsLoadingState());

    return restaurantImpl.getListOfRestaurant();
  }
}
