import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';
import 'package:flutter_application_1/src/Modelo/productosM.dart';

class propiedadesC extends StatelessWidget {
  List<productosM> descriProducto;
  int index;

  propiedadesC(this.descriProducto, this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Propiedades'),
          backgroundColor: Color(0xFF11253c),
          centerTitle: true,
        ),
        body: home(context));
  }

  Widget home(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [titulo(), contenedor()],
        ));
  }

  Widget titulo() {
    return Container(
        height: 110,
        padding: EdgeInsets.only(),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              descriProducto.elementAt(index).nombre,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )));
  }

  Widget contenedor() {
    return Expanded(
        child: Container(
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
                color: Color(0xFF454d5a),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                fondoImagen(),
                propiedadProductos(),
                campoPropiedades()
              ],
            )));
  }

  Widget fondoImagen() {
    return Expanded(
      child: Container(
          child: Image(
        // fit: BoxFit.fill,
        image: NetworkImage(descriProducto.elementAt(index).imagen),
      )),
    );
  }

  Widget propiedadProductos() {
    return Container(
      height: 250,
      alignment: Alignment.centerLeft,
      child: Column(children: [
        precio(),
        descripcion(),
      ]),
    );
  }

  Widget precio() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          descriProducto.elementAt(index).precio,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ));
  }

  Widget descripcion() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            descriProducto.elementAt(index).caracteristicas,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }

  Widget campoPropiedades() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: Color(0xFF333742),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: cancelarGusto(),
    );
  }

  Widget cancelarGusto() {
    return Padding(
        padding: EdgeInsets.only(),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.card_travel,
            color: Colors.white,
          ),
          onPressed: () async {
            mensaje().info("Se cancelo el producto");
          },
        ));
  }
}
