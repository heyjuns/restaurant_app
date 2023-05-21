import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_summary_entity.dart';

import 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  late RestaurantImpl restaurantImpl;
  late List<RestaurantSummaryEntity> listOfRestaurant = [];
  RestaurantsCubit({
    required this.restaurantImpl,
  }) : super(RestaurantsInitState());

  Future<void> getList() async {
    emit(RestaurantsLoadingState());
    var result = await restaurantImpl.getListOfRestaurant();
    if (result.error == false) {
      emit(RestaurantsLoadedState());
      listOfRestaurant = result.restaurants;
    } else {
      emit(RestaurantsErrorState(result.message));
    }
  }
}
