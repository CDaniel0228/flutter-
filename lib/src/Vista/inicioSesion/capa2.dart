import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';
import 'package:provider/provider.dart';
import '../Catalogo/catalogo.dart';

class capa2 {
  var boxUsuario;
  var boxContrasena;
  var authService;

  capa2(this.boxUsuario, this.boxContrasena);

  Widget campoUsuario() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 50, right: 50, top: 50),
        child: TextField(
            controller: boxUsuario, decoration: decoracion("Usuario")));
  }

  Widget campoContrasena() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxContrasena,
            obscureText: true,
            decoration: decoracion("Contraseña")));
  }

  Widget botonInicio(BuildContext context) {
    return Container(
        width: 150,
        padding: const EdgeInsets.only(top: 80),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            authService = Provider.of<Autentificacion>(context, listen: false);
            if (await authService.signIn(boxUsuario.text, boxContrasena.text) ==
                true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            }
          },
          child: const Text(
            'Iniciar Sesion',
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }

  Widget recuperarPassw(BuildContext context) {
    return Padding(
      //flatbutton
      padding: EdgeInsets.only(left: 50, right: 50, top: 5),
      child: TextButton(
          onPressed: () async {
            mensaje().info('Trabajando..');
          },
          child: const Text("¿Olvido su contraseña?",
              style: TextStyle(color: Color(0xFFffc797)))),
    );
  }

  Widget lbMensaje() {
    return const Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 50, right: 50, top: 15),
        child: Text(
          "Registrarse con",
          style: TextStyle(color: Color(0xFFffc797)),
        ));
  }

  Widget logoGoogle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(),
      width: 50,
      child: FlatButton(
          onPressed: () async {
            authService = Provider.of<Autentificacion>(context, listen: false);
            User? user = await authService.iniciarSecion(context: context);
            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            }
          },
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage("asset/google.png"),
          )),
    );
  }

  Widget logoFacebook(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(),
      width: 50,
      child: FlatButton(
          onPressed: () {},
          child: Image(
            fit: BoxFit.fill,
            image: AssetImage("asset/facebook.png"),
          )),
    );
  }

  Widget redes(context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [logoGoogle(context), logoFacebook(context)]));
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: Colors.red),
          borderRadius: BorderRadius.circular(15),
        ));
  }
}
