import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() func;
  final bool isSelected;
  final String text;
  const Button(
      {super.key,
      required this.func,
      required this.text,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: !isSelected
                ? Color.fromARGB(255, 247, 114, 25)
                : Colors.black.withOpacity(0.3)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
