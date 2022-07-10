import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Vista/Productos/articulos.dart';
import 'package:flutter_application_1/src/Vista/Productos/mostrar.dart';
import 'package:provider/provider.dart';

import '../../Control/Cuentas/Autentificacion.dart';
import '../../Control/Cuentas/producto_service.dart';
import '../../Modelo/productosM.dart';
import '../menuLateral.dart';

class EstructuraProducto extends StatefulWidget {
  @override
  _EstructuraProductoState createState() => _EstructuraProductoState();
}

class _EstructuraProductoState extends State<EstructuraProducto> {
  var correo;
  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    correo = authService.user?.email;
    return Scaffold(
        appBar: AppBar(
            title: Text('Productos'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: new SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [botonAgregar(), botonMostrar()],
        )));
  }

  Widget botonAgregar() {
    return Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image(image: AssetImage("asset/agregar.png")),
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => articulos()),
            );
          },
        ));
  }

  Widget botonMostrar() {
    return Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image(image: AssetImage("asset/ver.png")),
          onPressed: () async {
            List<productosM> productos =
                await ProductosService().getProducto(correo);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MostrarProductos(productos)),
            );
          },
        ));
  }
}
