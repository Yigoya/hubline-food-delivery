import 'package:flutter/material.dart';

class RestaurantEvent {}

class LoadRestaurantEvent extends RestaurantEvent {
  BuildContext context;
  int id;
  LoadRestaurantEvent({required this.id, required this.context});
}

class LoadRestaurantsEvent extends RestaurantEvent {
  BuildContext context;
  LoadRestaurantsEvent(this.context);
}
