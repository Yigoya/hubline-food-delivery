import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_bloc.dart';
import 'package:hubline/bloc/Food/food_event.dart';
import 'package:hubline/bloc/Food/food_state.dart';
import 'package:hubline/component/FoodItem.dart';
import 'package:hubline/component/FoodOrderItem.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodBloc = BlocProvider.of<FoodBloc>(context)
      ..add(FilterOrderEvent());
    return Scaffold(
      body: Container(
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state.foods != null) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: state.orderfoods!.length,
                      itemBuilder: (context, index) {
                        // return FoodOrderItem(food: state.orderfoods![index]);
                      }));
            } else {
              return Text("No item to order please select food");
            }
          },
        ),
      ),
      floatingActionButton: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(left: 80, right: 60),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.green),
        child: Center(
            child: Text(
          "Order",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
