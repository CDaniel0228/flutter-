import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
//Personales
import 'package:flutter_application_1/src/app.dart';
import 'package:provider/provider.dart';

import 'src/Control/Coneccion/check_internet_connection.dart';

final internetChecker = CheckInternetConnection();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(ChangeNotifierProvider(
      create: (context) => Autentificacion(),
      child: MyApp(),
    ));
  });
}
