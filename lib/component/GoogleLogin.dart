import 'package:flutter/material.dart';

class GoogleLogin extends StatelessWidget {
  final void Function() func;
  const GoogleLogin({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: 300,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Color.fromARGB(255, 243, 137, 51))),
        child: Row(
          children: [
            Image.asset(
              "assets/image/google.png",
              width: 40,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              "sign in with google",
              style: TextStyle(
                  color: Color.fromARGB(255, 243, 137, 51),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
