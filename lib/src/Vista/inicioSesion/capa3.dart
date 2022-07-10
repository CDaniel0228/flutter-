import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';
import 'package:flutter_application_1/src/Modelo/usuarioM.dart';

import '../../Control/Cuentas/usuario_service.dart';

class capa3 {
  var boxCorreo;
  var boxContrasena;
  var boxConfirmar;
  capa3(this.boxCorreo, this.boxContrasena, this.boxConfirmar);

  Widget campoEmail() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: TextField(
            controller: boxCorreo,
            keyboardType: TextInputType.emailAddress,
            decoration: decoracion("Email")));
  }

  Widget campoContrasena() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena,
            obscureText: true,
            decoration: decoracion("Contraseña")));
  }

  Widget campoConfirmar() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxConfirmar,
            obscureText: true,
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
    return Container(
        width: 150,
        padding: EdgeInsets.only(top: 50),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            if (boxCorreo.text != '' &&
                boxContrasena.text != '' &&
                boxConfirmar.text != '') {
              if (validateEmail(boxCorreo.text)) {
                if (boxContrasena.text == boxConfirmar.text) {
                  if (!await Autentificacion()
                      .crearUsuario(boxCorreo.text, boxContrasena.text)) {
                  } else {
                    ProfileService().usuarioAdd(usuarioM(
                        "nombre", "telefono", "direccion", boxCorreo.text));
                    mensaje().info('Cuenta creada');
                    limpiar();
                  }
                } else {
                  mensaje().info('No coiciden las cotraseña');
                }
              } else {
                mensaje().info('Correo no valido');
              }
            } else {
              mensaje().info("campos bacios");
            }
          },
          child: const Text('Registrarme',
              style: TextStyle(fontSize: 15, color: Colors.white)),
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

  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
