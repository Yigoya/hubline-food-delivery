import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMyToast() {
  Fluttertoast.showToast(
    msg: 'Network connection lost.',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
  );
}

// ... in your code

void showMySnackbar(BuildContext context, String text) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);

  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Undo action logic
        },
      ),
    ),
  );
}
