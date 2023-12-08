import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_prakash/flutter_prakash.dart';

void toast(String message, {bool isLong = false}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      //backgroundColor: AppColors.error,
      textColor: Colors.lightBlue,
      fontSize: 14);
}

void snack(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void print(String message) {
  dev.log("Flutter_Prakash_PRINT: $message");
}

void log(String message) {
  dev.log("Flutter_Prakash_LOG: $message");
}
