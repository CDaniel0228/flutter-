import 'package:flutter/material.dart';

class capa1 {
  String nombre = "";
  Widget logo() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Image(
        image: AssetImage('asset/login.png'),
      ),
    );
  }
}
