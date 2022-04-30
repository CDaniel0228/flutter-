import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Cuentas/Autentificacion.dart';
import 'package:flutter_application_1/src/Vista/menuCasa.dart';
import 'package:provider/provider.dart';

class estructura extends StatefulWidget {
  @override
  _estructuraState createState() => _estructuraState();
}

class _estructuraState extends State<estructura> {
  final boxNombre = TextEditingController();
  final boxContrasena = TextEditingController();

  String nombre = "c2";
  int indice = 0;
  var send = [];
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
            controller: boxContrasena, decoration: decoracion(nombreUsuario)));
  }

  Widget campoEmail() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion(correoUsuario)));
  }

  Widget campoTelefono() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion("Telefono")));
  }

  Widget campoDireccion() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 30, right: 30, top: 30),
        child: TextField(
            controller: boxContrasena, decoration: decoracion("Dirreccion")));
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
          onPressed: () async {},
          child: const Text(
            "Guardar",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )));
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
