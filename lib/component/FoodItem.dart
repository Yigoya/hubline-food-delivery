import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_event.dart';
import 'package:hubline/model/Food.dart';
import 'package:hubline/repositiory/AuthRepo.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  const FoodItem({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RestaurantBloc>(context)
            .add(LoadRestaurantEvent(id: food.restaurantid, context: context));
      },
      child: Container(
        width: 230,
        alignment: Alignment.center,
        child: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            padding: EdgeInsets.only(top: 110, left: 10, right: 10),
            height: 230,
            width: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 20)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food.name,
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500, height: 1),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "12 birr",
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 255, 160, 52)),
                      child: Text("Detail",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    )
                  ],
                )
              ],
            ),
          ),
          food.imagename != null
              ? Container(
                  alignment: Alignment.topCenter,
                  child: ClipOval(
                    child: Image.network(
                      AuthRepo.SERVER + '/images/${food.imagename}'!,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }
}
