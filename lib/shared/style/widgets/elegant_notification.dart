import 'package:flutter/material.dart';

class ToastMassage {
  BuildContext context;
  String message;
  String status;
  Color? color;

  ToastMassage(this.context, this.message, this.status) {
    if (status == "success") {
      color = const Color(0xff17a00e);
    } else if (status == "error") {
      color = const Color(0xffce2336);
    } else if (status == "info") {
      color = Colors.blueGrey;
    } else if (status == "warning") {
      color = Colors.orange;
    } else if (status == "default_") {
      color = Colors.grey;
    }

    messageDisplay();
  }

  void messageDisplay() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        // padding: const EdgeInsets.all(0),
        duration: const Duration(seconds: 5),
        // dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class Status {
  static String success = "success";
  static String error = "error";
  static String info = "info";
  static String warning = "warning";
  static String default_ = "default";
}
