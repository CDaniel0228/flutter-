import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Modelo/auxProductos.dart';
import 'package:flutter_application_1/src/Modelo/productosM.dart';
import 'package:flutter_application_1/src/Vista/Compras/propiedadesC.dart';
import 'package:flutter_application_1/src/Vista/menuCasa.dart';
import 'package:provider/provider.dart';

import '../../Control/Cuentas/Autentificacion.dart';
import '../../Control/Cuentas/compras_service.dart';
import '../menuLateral.dart';

class compras extends StatefulWidget {
  @override
  _comprasState createState() => _comprasState();
}

class _comprasState extends State<compras> {
  final boxBuscar = TextEditingController();
  List<productosM> listProductos = [];
  //Filtrar

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    String? correo = authService.user?.email;
    _fetchListItems(correo);
    return Scaffold(
        appBar: AppBar(
            title: Text('Compras'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: new SingleChildScrollView(child: home(context)));
  }

  _fetchListItems(email) async {
    List<productosM> lista = await CompraService().getCompraEmail(email);
    setState(() {
      listProductos = lista;
    });
  }

  Widget home(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            campoBusqueda(),
            listaProducto(context),
            menuCasa().campoCasa(context)
          ],
        )));
  }

  Widget listaProducto(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.only(top: 30),
      child: ListView(
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.horizontal,
        children: generateItem(context),
      ),
    );
  }

  Widget campoBusqueda() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: TextField(
            controller: boxBuscar, decoration: decoracion("Buscar producto")));
  }

  decoracion(nombre) {
    return InputDecoration(
        labelText: nombre,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ));
  }

  List<Widget> generateItem(context) {
    final list = <Widget>[];

    for (int i = 0; i < (listProductos.length); i++) {
      list.add(articulos(
          context,
          listProductos.elementAt(i).imagen,
          listProductos.elementAt(i).nombre,
          listProductos.elementAt(i).precio,
          listProductos.elementAt(i).caracteristicas,
          i));
      //Separa las Columnas
      list.add(Divider());
    }
    return list;
  }

  Widget articulos(
    context,
    imagen,
    nombre,
    precio,
    caracteristicas,
    index,
  ) {
    return Padding(
        padding: EdgeInsets.only(right: 10),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          producto(context, imagen, nombre, precio, caracteristicas, index),
          // producto(context, imagen2, nombre2, precio, caracteristicas, index2)
        ]));
  }

  producto(context, imagenp, nombrep, precio, caracteristicas, index) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 380,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              gradient: LinearGradient(
                  colors: [Color(0XFF535b67), Color(0xFF454d5a)],
                  begin: Alignment(0.0, 0.0),
                  end: Alignment(0.0, 0.9))),
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => propiedadesC(listProductos, index)),
                );
              },
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(imagenp),
              )),
        ),
        Container(
            decoration: const BoxDecoration(
                color: Color(0xFF454d5a),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            width: 320,
            height: 150,
            child: Text(
              nombrep,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ))
      ],
    );
  }
}
