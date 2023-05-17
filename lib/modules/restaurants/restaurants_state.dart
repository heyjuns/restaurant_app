import 'package:flutter/material.dart';

@immutable
abstract class RestaurantsState {}

class RestaurantsInitEvent extends RestaurantsState {}

class RestaurantsNoInternetEvent extends RestaurantsState {}

class RestaurantsLoadedEvent extends RestaurantsState {}

class RestaurantsLoadingEvent extends RestaurantsState {}

class RestaurantsErrorEvent extends RestaurantsState {
  late final String errorMessage;
  RestaurantsErrorEvent(this.errorMessage);
}
