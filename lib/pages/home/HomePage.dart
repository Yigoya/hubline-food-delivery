import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_bloc.dart';
import 'package:hubline/bloc/Food/food_event.dart';
import 'package:hubline/bloc/Food/food_state.dart';
import 'package:hubline/bloc/Restaurant/restaurant_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_event.dart';
import 'package:hubline/bloc/Restaurant/restaurant_state.dart';
import 'package:hubline/component/FoodItem.dart';
import 'package:hubline/component/Header.dart';
import 'package:hubline/component/RestaurantItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodBloc = BlocProvider.of<FoodBloc>(context)
      ..add(LoadfoodsEvent(context));
    final restaurantBloc = BlocProvider.of<RestaurantBloc>(context)
      ..add(LoadRestaurantsEvent(context));
    return Scaffold(
      appBar: AppHeader(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular food"),
                GestureDetector(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/food');
                    restaurantBloc.add(LoadRestaurantsEvent(context));
                  },
                  child: Text("See all"),
                )
              ],
            ),
            BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state.foods != null) {
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.foods!.length,
                        itemBuilder: (context, index) {
                          return FoodItem(food: state.foods![index]);
                        }),
                  );
                } else {
                  return CircularProgressIndicator.adaptive();
                }
              },
            ),
            BlocBuilder<RestaurantBloc, RestaurantState>(
              builder: (context, state) {
                if (state.restaurants != null) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: state.restaurants!.length * 270,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.restaurants!.length,
                        itemBuilder: (context, index) {
                          return RestaurantItem(
                              restaurant: state.restaurants![index]);
                        }),
                  );
                } else {
                  return CircularProgressIndicator.adaptive();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
