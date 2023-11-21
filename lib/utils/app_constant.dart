import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstant {
  static void showToast(String msg) {
    ///Can make it more customizable
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
