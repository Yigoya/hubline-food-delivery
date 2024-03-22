import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_bloc.dart';
import 'package:hubline/bloc/Food/food_state.dart';

PreferredSizeWidget? AppHeader() {
  return AppBar(
    title: Text("title"),
    actions: [
      BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          return IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/order");
              },
              icon: Icon(Icons.shop_2));
        },
      )
    ],
  );
}
