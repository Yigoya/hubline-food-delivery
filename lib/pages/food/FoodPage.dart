import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_bloc.dart';
import 'package:hubline/bloc/Food/food_state.dart';
import 'package:hubline/component/FoodItem.dart';
import 'package:hubline/component/Header.dart';

class FoodPage extends StatelessWidget {
  FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return CircularProgressIndicator.adaptive();
          } else if (state.foods != null) {
            return Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: (state.foods!.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    return Row(children: []);
                  }),
            );
          } else {
            return Text("data");
          }
        },
      ),
    );
  }
}
