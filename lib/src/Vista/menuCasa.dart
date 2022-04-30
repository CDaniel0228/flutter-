import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Vista/Catalogo/catalogo.dart';
import 'package:flutter_application_1/src/Vista/Compras/compras.dart';
import 'package:flutter_application_1/src/Vista/Usuario/estructura.dart';

class menuCasa {
  Widget campoCasa(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          color: Color(0XFF535b67),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          datosCasa(context),
          datosCompra(context),
          datosPersonales(context)
        ],
      ),
    );
  }

  Widget datosCasa(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ));
  }

  Widget datosCompra(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => compras()),
            );
          },
          child: Icon(
            Icons.card_travel,
            color: Colors.white,
          ),
        ));
  }

  Widget datosPersonales(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => estructura()),
            );
            //Navigator.of(context).pushNamed(estructura(), user);
          },
          child: const Icon(
            Icons.person,
            color: Colors.white,
          ),
        ));
  }
}
