import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alerts {
  user_toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
