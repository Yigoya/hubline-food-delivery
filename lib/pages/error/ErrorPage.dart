import 'package:flutter/material.dart';
import 'package:hubline/utility.dart';

class ErrorPage extends StatelessWidget {
  final data;
  const ErrorPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    String? image;

    switch (data['type']) {
      case ErrorType.noconnect:
        image = 'assets/image/warning.png';
        break;
      case ErrorType.pagenotfound:
        image = 'assets/image/pagenotfound.png';
        break;
      case ErrorType.timeout:
        image = 'assets/image/warning.png';
        break;
      default:
        image = 'assets/image/warning.png';
        break;
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Image.asset(image!),
          Text(
            data['msg'],
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
