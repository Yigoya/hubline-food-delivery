import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_event.dart';
import 'package:hubline/bloc/Food/food_state.dart';
import 'package:hubline/model/Customer.dart';
import 'package:hubline/model/Food.dart';
import 'package:hubline/repositiory/AuthRepo.dart';
import 'package:hubline/repositiory/FoodAndRestoRepo.dart';
import 'package:hubline/utility.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodAndRetaurRepo repo = FoodAndRetaurRepo();
  AuthRepo authRepo = AuthRepo();
  FoodBloc() : super(InitialState()) {
    on<LoadfoodsEvent>(_loadfoods);
    on<LoadfoodEvent>(_loadSingleFood);
    on<LoadfoodByResEvent>(_loadByResFood);
    on<OrderEvent>(_addToOrder);
    // on<FilterOrderEvent>(_filterOrder);
  }
  Future<void> _loadfoods(LoadfoodsEvent event, Emitter<FoodState> emit) async {
    emit(LoadingState());
    try {
      final foods = await repo.foods();
      print(foods);
      emit(FoodState(foods: foods, filteredfoods: state.filteredfoods));
    } catch (e) {
      if (e is DioException) {
        String error = handleDioError(e);
        print(error);
        final arg = {"type": ErrorType.noconnect, "msg": error};
        Navigator.pushNamed(event.context, '/error', arguments: arg);
      }
    }
  }

  Future<void> _loadSingleFood(
      LoadfoodEvent event, Emitter<FoodState> emit) async {
    emit(LoadingState());
    final food = await repo.food(event.id);
    emit(FoodState(
        food: food, foods: state.foods, filteredfoods: state.filteredfoods));
  }

  Future<void> _loadByResFood(
      LoadfoodByResEvent event, Emitter<FoodState> emit) async {
    final foods =
        state.foods!.where((e) => e.restaurantid == event.id).toList();
    print(foods[0].name);
    emit(FoodState(foods: state.foods, filteredfoods: foods, food: state.food));
  }

  Future<void> _addToOrder(OrderEvent event, Emitter<FoodState> emit) async {
    // emit(LoadingState());
    try {
      Customer? customer = await authRepo.customer;
      print(event.orders);
      final foods = await repo.order(
          customer!.id, event.id, 1, event.orders.length, event.orders);
      // emit(FoodState(foods: foods));
    } catch (e) {
      if (e is DioException) {
        print(e.toString());
        String error = handleDioError(e);
        print(error);
        final arg = {"type": ErrorType.noconnect, "msg": error};
        Navigator.pushNamed(event.context, '/error', arguments: arg);
      }
    }
  }

  // Future<void> _filterOrder(
  //     FilterOrderEvent event, Emitter<FoodState> emit) async {
  //   if (state.orderfoods != null) {
  //     List<int> resId = [];
  //     List<List<Food>> filtered = [];
  //     for (var i = 0; i < state.orderfoods!.length; i++) {
  //       if (!resId.contains(state.orderfoods![i].id)) {
  //         resId.add(state.orderfoods![i].id);
  //       }
  //     }

  //     for (var i = 0; i < resId.length; i++) {
  //       List<Food> foods = state.orderfoods!
  //           .where((element) => element.id == resId[i])
  //           .toList();
  //       filtered.add(foods);
  //     }
  //     print('hvtxi6rz76rz76rz787t');
  //     print(filtered);

  //     emit(
  //         FoodState(resId: resId, filteredfoods: filtered, foods: state.foods));
  //   } else {
  //     print('yiu');
  //     emit(FoodState(foods: state.foods, food: state.food));
  //   }
  // }
}
