import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hubline/bloc/Food/food_bloc.dart';
import 'package:hubline/bloc/Food/food_event.dart';
import 'package:hubline/bloc/Food/food_state.dart';
import 'package:hubline/component/FoodOrderItem.dart';
import 'package:hubline/model/Restaurant.dart';
import 'package:hubline/repositiory/AuthRepo.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage({super.key, required this.restaurant});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  Map<String, int> _orders = {};

  void setOrder(String id, int order) {
    Map<String, int> orders = _orders;
    orders[id] = order;
    print(orders);
    setState(() {
      _orders = orders;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isImage = true;
    print(widget.restaurant.name);
    final foodBloc = BlocProvider.of<FoodBloc>(context)
      ..add(LoadfoodByResEvent(id: widget.restaurant.id, context: context));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("data"),
            isImage
                ? Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                        AuthRepo.SERVER +
                            '/images/${widget.restaurant.imagename}'!,
                      ),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) => {
                        setState(
                          () {
                            isImage = false;
                          },
                        )
                      },
                    )),
                  )
                : Container(
                    child: Text("Image don't exicet"),
                  ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  widget.restaurant.name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state.filteredfoods != null) {
                  return SizedBox(
                    height: state.filteredfoods!.length * 250,
                    width: 370,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Two items per row
                        crossAxisSpacing: 0, // Spacing between items
                        mainAxisSpacing: 0, // Spacing between rows
                      ),
                      itemCount: state.filteredfoods!.length,
                      itemBuilder: (context, index) {
                        var data = state.filteredfoods![index];
                        return FoodOrderItem(setOrder: setOrder, food: data);
                      },
                    ),
                  );
                } else {
                  return CircularProgressIndicator.adaptive();
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodBloc.add(OrderEvent(
              orders: _orders, id: widget.restaurant.id, context: context));
        },
        child: Text("Order"),
      ),
    );
  }
}
