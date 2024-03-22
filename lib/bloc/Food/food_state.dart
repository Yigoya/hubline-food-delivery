import 'package:hubline/model/Customer.dart';
import 'package:hubline/model/Food.dart';

class FoodState {
  final List<int>? resId;
  final List<Food>? orderfoods;
  final List<Food>? filteredfoods;
  final List<Food>? foods;
  final Food? food;
  FoodState(
      {this.orderfoods, this.foods, this.food, this.resId, this.filteredfoods});
}

class InitialState extends FoodState {}

class LoadingState extends FoodState {}

class FoodsState extends FoodState {
  FoodsState();
}

class FoodsOrderState extends FoodState {}

class SingleFoodState extends FoodState {}
