import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/domain/entities/restaurant_detail_entity.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_detail/restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  late RestaurantImpl restaurantImpl;
  late RestaurantDetailEntity restaurantDetail;

  RestaurantDetailCubit({
    required this.restaurantImpl,
  }) : super(RestaurantDetailInitState());

  Future<void> getDetail(String id) async {
    try {
      emit(RestaurantDetailLoadingState());
      var result = await restaurantImpl.getRestaurantDetail(id);
      if (result.error == false) {
        restaurantDetail = result.restaurant;
        emit(RestaurantDetailLoadedState(restaurant: result.restaurant));
      } else {
        emit(RestaurantDetailErrorState(result.message));
      }
    } catch (e) {
      emit(RestaurantDetailNoInternetState());
    }
  }
}
