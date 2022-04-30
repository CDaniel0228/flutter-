import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
//Personales
import 'package:flutter_application_1/src/app.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(ChangeNotifierProvider(
      create: (context) => Autentificacion(),
      child: MyApp(),
    ));
  });
}
