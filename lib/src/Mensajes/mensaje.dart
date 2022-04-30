import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class mensaje {
  info(titulo) {
    Fluttertoast.showToast(
        msg: titulo,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xFF333742),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
