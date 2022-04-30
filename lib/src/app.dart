import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Vista/Bienvenida/bienvenida.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFF454d5a),
      home: Center(
        child: bienvenida().animacion(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
