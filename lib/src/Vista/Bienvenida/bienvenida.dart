import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../inicioSesion/estructura.dart';

class bienvenida {
  Widget animacion() {
    return AnimatedSplashScreen(
        splashIconSize: 350,
        duration: 1000,
        splash: 'asset/Bienvenida.png',
        nextScreen: estructura(),
        //splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.rightToLeftWithFade,
        backgroundColor: Color(0xFF454d5a));
  }
}
