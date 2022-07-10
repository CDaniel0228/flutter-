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
    return Scaffold(
        bottomNavigationBar: menuCasa().campoCasa(context),
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
            botonGuardar(context),
            SizedBox(height: 120),
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
        child:
            TextField(controller: boxNombre, decoration: decoracion("Nombre")));
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

  Widget botonGuardar(BuildContext context) {
    return Container(
        width: 300,
        padding: const EdgeInsets.only(top: 50, right: 50, left: 50),
        child: FlatButton(
          color: Color(0xFF11253c),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () async {
            ProfileService().update(usuarioM(
              boxNombre.text,
              boxTelefono.text,
              boxDireccion.text,
              correoUsuario,
            ));
          },
          child: const Text(
            "Guardar",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ));
  }

  /* _fetchListItems(correo) async {
    usuarioM usi = await ProfileService().usuarioGet(email: correo);
    setState(() {
      nuevoUsuario = usi;
    });
  }*/

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
