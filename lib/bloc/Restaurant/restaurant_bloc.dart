import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_event.dart';
import 'package:hubline/bloc/Restaurant/restaurant_state.dart';
import 'package:hubline/repositiory/FoodAndRestoRepo.dart';
import 'package:hubline/utility.dart';
import 'package:hubline/model/Customer.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  FoodAndRetaurRepo repo = FoodAndRetaurRepo();
  RestaurantBloc() : super(InitialState()) {
    on<LoadRestaurantsEvent>(_loadRestaurants);
    on<LoadRestaurantEvent>(_loadSingleRestaurant);
  }
  Future<void> _loadRestaurants(
      LoadRestaurantsEvent event, Emitter<RestaurantState> emit) async {
    emit(LoadingState());
    try {
      final restaurants = await repo.restaurants();
      print(restaurants);
      emit(RestaurantState(restaurants: restaurants));
    } catch (e) {
      if (e is DioException) {
        String error = handleDioError(e);
        print(error);
        final arg = {"type": ErrorType.noconnect, "msg": error};
        Navigator.pushNamed(event.context, '/error', arguments: arg);
      }
    }
  }

  Future<void> _loadSingleRestaurant(
      LoadRestaurantEvent event, Emitter<RestaurantState> emit) async {
    if (state.restaurants != null) {
      final restaurants = [...state.restaurants!];
      final restaurant =
          state.restaurants!.singleWhere((element) => element.id == event.id);
      Navigator.pushNamed(event.context, '/restaurant', arguments: restaurant);
      // emit(RestaurantState(restaurant: restaurant));
    }
  }
}
