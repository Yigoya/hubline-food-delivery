import 'package:flutter/material.dart';

class CatagoryIcons extends StatelessWidget {
  final void Function() func;
  final String image;
  final String text;
  const CatagoryIcons(
      {super.key, required this.func, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(0, 3),
                      blurRadius: 3)
                ]),
            child: Image.asset(
              image,
              width: 40,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    );
  }
}
