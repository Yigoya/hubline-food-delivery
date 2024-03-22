import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_bloc.dart';
import 'package:hubline/bloc/Restaurant/restaurant_event.dart';
import 'package:hubline/model/Restaurant.dart';
import 'package:hubline/repositiory/FoodAndRestoRepo.dart';

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final repo = FoodAndRetaurRepo();

    return GestureDetector(
      onTap: () {
        BlocProvider.of<RestaurantBloc>(context)
            .add(LoadRestaurantEvent(id: restaurant.id, context: context));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        width: 310,
        height: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                opacity: 1,
                fit: BoxFit.cover,
                image: NetworkImage(
                    '${repo.SERVER}/images/${restaurant.imagename}'))),
        child: Container(
          width: 310,
          height: 260,
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.6)
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "vmei neiwn ",
                style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                      )
                    ],
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "lali pop laly pop lofd mier vmei neiwn ",
                style: TextStyle(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ],
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.map_rounded,
                    color: Colors.white,
                    size: 45,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 245, 59, 52)),
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
      ),
    );
  }
}
