import 'package:hubline/model/Customer.dart';
import 'package:hubline/model/Restaurant.dart';

class RestaurantState {
  List<Restaurant>? restaurants;
  Restaurant? restaurant;
  RestaurantState({this.restaurant, this.restaurants});
}

class InitialState extends RestaurantState {}

class LoadingState extends RestaurantState {}

class RestaurantsState extends RestaurantState {}

class SingleRestaurantState extends RestaurantState {}
