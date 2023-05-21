import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/modules/restaurants/data/repositories/restaurant_impl.dart';
import 'package:restaurant_app/modules/restaurants/features/restaurant_detail/restaurant_detail_state.dart';

class RestaurantDetailCubit extends Cubit<RestaurantDetailState> {
  late RestaurantImpl restaurantImpl;
  RestaurantDetailCubit({
    required this.restaurantImpl,
  }) : super(RestaurantDetailInitState());

  Future<void> getDetail(String id) async {
    emit(RestaurantDetailLoadingState());
    var result = await restaurantImpl.getRestaurantDetail(id);
    if (result.error == false) {
      emit(RestaurantDetailLoadedState(restaurant: result.restaurant));
    } else {
      emit(RestaurantDetailErrorState(result.message));
    }
  }
}