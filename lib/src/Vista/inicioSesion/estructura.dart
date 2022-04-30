import 'package:flutter/material.dart';
import 'capa1.dart';

import 'capa2.dart';
import 'capa3.dart';

class estructura extends StatefulWidget {
  @override
  _estructuraState createState() => _estructuraState();
}

class _estructuraState extends State<estructura> {
  final boxCorreo = TextEditingController();
  final boxContrasena = TextEditingController();
  final boxConfirmar = TextEditingController();

  String nombre = "c2";
  int indice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inicio Sesion'),
          centerTitle: true,
          backgroundColor: Color(0xFF11253c),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        child: Column(
      children: [primeraCapa(context), lista(context)[indice]],
    ));
  }

  Widget primeraCapa(BuildContext context) {
    return Container(
      // color: Color(0xFF454d5a),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [capa1().logo(), subCapa(context)],
      )),
      decoration: BoxDecoration(color: Color(0xFF454d5a), boxShadow: [
        BoxShadow(
          color: Color(0xFFffc797),
          offset: new Offset(0, 3),
          blurRadius: 30,
        )
      ]),
    );
  }

  Widget segundaCapa(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        capa2(boxCorreo, boxContrasena).campoUsuario(),
        capa2(boxCorreo, boxContrasena).campoContrasena(),
        capa2(boxCorreo, boxContrasena).botonInicio(context),
        capa2(boxCorreo, boxContrasena).recuperarPassw(context),
        capa2(boxCorreo, boxContrasena).lbMensaje(),
        capa2(boxCorreo, boxContrasena).redes(context),
      ],
    )));
  }

  Widget terceraCapa(
    BuildContext context,
  ) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        capa3(boxCorreo, boxContrasena, boxConfirmar).campoEmail(),
        capa3(boxCorreo, boxContrasena, boxConfirmar).campoContrasena(),
        capa3(boxCorreo, boxContrasena, boxConfirmar).campoConfirmar(),
        capa3(boxCorreo, boxContrasena, boxConfirmar).botonRegistrar(
          context,
        )
      ],
    )));
  }

  List<Widget> lista(context) {
    final list = <Widget>[];
    list.add(segundaCapa(context));
    list.add(terceraCapa(context));
    return list;
  }

  Widget subCapa(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        botones(context, "Inicio", Alignment.bottomLeft),
        botones(context, "Nuevo", Alignment.bottomRight)
      ],
    );
  }

  Widget botones(BuildContext context, titulo, alineacion) {
    return Padding(
        padding: const EdgeInsets.only(top: 80, right: 50, left: 50),
        child: Align(
            alignment: alineacion,
            child: FlatButton(
              color: Colors.transparent,
              shape: const Border(
                bottom: BorderSide(width: 5, color: Color(0xFFffc797)),
              ),
              onPressed: () async {
                if (titulo == "Inicio") {
                  setState(() {
                    indice = 0;
                  });
                } else if (titulo == "Nuevo") {
                  setState(() {
                    indice = 1;
                  });
                }
              },
              child: Text(
                titulo,
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            )));
  }
}
