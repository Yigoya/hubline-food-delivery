import 'package:flutter/material.dart';
import 'package:hubline/model/Food.dart';

class FoodEvent {}

class LoadfoodEvent extends FoodEvent {
  int id;
  LoadfoodEvent(this.id);
}

class LoadfoodsEvent extends FoodEvent {
  BuildContext context;
  LoadfoodsEvent(this.context);
}

class LoadfoodByResEvent extends FoodEvent {
  int id;
  BuildContext context;
  LoadfoodByResEvent({required this.context, required this.id});
}

class FilterOrderEvent extends FoodEvent {}

class OrderEvent extends FoodEvent {
  Map<String, int> orders;
  int id;
  BuildContext context;
  OrderEvent({required this.orders, required this.id, required this.context});
}
