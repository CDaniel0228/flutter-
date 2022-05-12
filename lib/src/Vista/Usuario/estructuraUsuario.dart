import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
import 'package:flutter_application_1/src/Modelo/usuarioM.dart';
import 'package:flutter_application_1/src/Vista/menuCasa.dart';
import 'package:provider/provider.dart';

import '../../Control/Cuentas/usuario_service.dart';

class estructura extends StatefulWidget {
  @override
  _estructuraState createState() => _estructuraState();
}

class _estructuraState extends State<estructura> {
  final boxNombre = TextEditingController();
  final boxContrasena = TextEditingController();
  final boxDireccion = TextEditingController();
  final boxCorreo = TextEditingController();
  final boxTelefono = TextEditingController();

  var imagenUsuario;
  var nombreUsuario;
  var correoUsuario;

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    imagenUsuario = authService.user?.photoURL;
    nombreUsuario = authService.user?.displayName;
    correoUsuario = authService.user?.email;
    print(authService.user?.photoURL);
    return Scaffold(
        appBar: AppBar(
          title: Text('Perfil'),
          centerTitle: true,
          backgroundColor: Color(0xFF11253c),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Column(
          children: [
            imagenPerfil(context),
            campoNombre(),
            campoEmail(),
            campoTelefono(),
            campoDireccion(),
            campoContrasena(),
            botonGuardar(context),
            botonMostrar(context),
            menuCasa().campoCasa(context)
          ],
        ));
  }

  Widget imagenPerfil(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: imagenUsuario != null
                      ? NetworkImage(imagenUsuario) as ImageProvider
                      : AssetImage('asset/login.png'))),
        ));
  }

  Widget campoNombre() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxNombre, decoration: decoracion(nombreUsuario)));
  }

  Widget campoEmail() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
          controller: boxCorreo,
          decoration: decoracion(correoUsuario),
          enabled: false,
        ));
  }

  Widget campoTelefono() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxTelefono, decoration: decoracion("Telefono")));
  }

  Widget campoDireccion() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxDireccion, decoration: decoracion("Dirreccion")));
  }

  Widget campoContrasena() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion("Contraseña")));
  }

  Widget botonGuardar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, right: 50, left: 50),
        child: Align(
            child: FlatButton(
          color: Colors.transparent,
          shape: const Border(
            bottom: BorderSide(width: 5, color: Color(0xFFffc797)),
          ),
          onPressed: () async {
            ProfileService().usuarioAdd(usuarioM('nombre2', 'apellido',
                'telefono', 'direccion', 'correo2', 'contrasena'));
          },
          child: const Text(
            "Guardar",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )));
  }

  Widget botonMostrar(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50, right: 50, left: 50),
        child: Align(
            child: FlatButton(
          color: Colors.transparent,
          shape: const Border(
            bottom: BorderSide(width: 5, color: Color(0xFFffc797)),
          ),
          onPressed: () async {
            print('object');
            usuarioM usi = await ProfileService().usuarioGet(email: 'correo2');
            if (usi != null) {
              print(usi.nombre);
            }
          },
          child: const Text(
            "Ver",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )));
  }

  Widget getUsu() {
    return FutureBuilder(
        future: ProfileService().usuarioGet(email: 'correo2'),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            usuarioM usi = snapshot.data as usuarioM;
            print(usi.nombre);
          } else {
            print('222');
          }
          return CircularProgressIndicator();
        });
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
}
