import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';

class capa3 extends StatefulWidget {
  var boxCorreo;
  var boxContrasena;
  var boxConfirmar;
  capa3(this.boxCorreo, this.boxContrasena, this.boxConfirmar);

  Widget campoEmail() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child:
            TextField(controller: boxCorreo, decoration: decoracion("Email")));
  }

  Widget campoContrasena() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion("Contraseña")));
  }

  Widget campoConfirmar() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxConfirmar,
            decoration: decoracion("Confirmar contraseña")));
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(30),
        ));
  }

  Widget botonRegistrar(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            if (boxContrasena.text == boxConfirmar.text) {
              if (!await Autentificacion()
                  .crearUsuario(boxCorreo.text, boxContrasena.text)) {
                mensaje().info('No se creo');
              } else {
                mensaje().info('Cuenta creada');
                limpiar();
              }
            } else {
              mensaje().info("No coinciden las contraseñas");
            }
          },
          child: const Text('Registrarme',
              style: TextStyle(fontSize: 10, color: Colors.white)),
        ));
  }

  camposBacios() {
    boxCorreo.text.isNotEmpty && boxContrasena.text.isNotEmpty;
  }

  limpiar() {
    boxCorreo.text = '';
    boxContrasena.text = '';
    boxConfirmar.text = '';
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
