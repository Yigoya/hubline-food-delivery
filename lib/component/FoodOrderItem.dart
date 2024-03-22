import 'package:flutter/material.dart';
import 'package:hubline/component/Button.dart';
import 'package:hubline/model/Food.dart';
import 'package:hubline/repositiory/AuthRepo.dart';

class FoodOrderItem extends StatefulWidget {
  final Food food;
  final void Function(String, int) setOrder;
  const FoodOrderItem({super.key, required this.food, required this.setOrder});

  @override
  State<FoodOrderItem> createState() => _FoodOrderItemState();
}

class _FoodOrderItemState extends State<FoodOrderItem> {
  bool isSelected = false;
  int amount = 1;
  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                opacity: 0.3,
                image: NetworkImage(
                    AuthRepo.SERVER + '/images/${widget.food.imagename}'!))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.food.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('amount: '),
                IconButton(
                    onPressed: () {
                      if (amount > 1) {
                        setState(() {
                          amount -= 1;
                        });
                        widget.setOrder(widget.food.id.toString(), amount);
                      }
                    },
                    icon: Icon(Icons.remove_circle)),
                Text('$amount'),
                IconButton(
                    onPressed: () {
                      setState(() {
                        amount += 1;
                      });
                      widget.setOrder(widget.food.id.toString(), amount);
                    },
                    icon: Icon(Icons.add_circle)),
              ],
            ),
            Button(
                isSelected: isSelected,
                func: () {
                  setState(() {
                    isSelected = false;
                  });
                },
                text: "unSelect"),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            widget.food.imagename != null
                ? Container(
                    alignment: Alignment.topCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.network(
                        AuthRepo.SERVER + '/images/${widget.food.imagename}'!,
                        width: 170,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
            Text(widget.food.name),
            Button(
                func: () {
                  widget.setOrder(widget.food.id.toString(), amount);
                  setState(() {
                    isSelected = true;
                  });
                },
                text: "Select"),
          ],
        ),
      );
    }
  }
}
