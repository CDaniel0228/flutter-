import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Vista/menuCasa.dart';

import '../../Control/Cuentas/producto_service.dart';
import '../../Modelo/productosM.dart';
import '../Propiedades/propiedades.dart';
import '../menuLateral.dart';
import 'categorias.dart';

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final boxBuscar = TextEditingController();
  List<productosM> listProductos = [];
  //Filtrar
  @override
  Widget build(BuildContext context) {
    _fetchListItems();
    return Scaffold(
        appBar: AppBar(
            title: Text('Catalogo'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: new SingleChildScrollView(child: home(context)));
  }

  Widget home(BuildContext context) {
    return Container(
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Categories(),
            campoBusqueda(),
            listaProducto(context),
            menuCasa().campoCasa(context)
          ],
        )));
  }

  Widget listaProducto(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Container(
          height: 535,
          child: ListView(
            children: generateItem(context),
            addAutomaticKeepAlives: false,
            scrollDirection: Axis.vertical,
          )),
    );
  }

  Widget campoBusqueda() {
    return Padding(
        //flatbutton
        padding: EdgeInsets.only(left: 20, right: 20),
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

  _fetchListItems() async {
    List<productosM> lista = await ProductosService().getProductoAll();
    setState(() {
      listProductos = lista;
    });
  }

  List<Widget> generateItem(context) {
    final list = <Widget>[];
    int count = 1;

    if (listProductos.length % 2 != 0) {
      listProductos.add(productosM(
          "https://firebasestorage.googleapis.com/v0/b/tecnoapp-e8d99.appspot.com/o/error.jpg?alt=media&token=22312baa-bbea-496f-abbd-64b411576dca",
          "Apple \n Mackbook",
          "6.780.000",
          "Core i5, 8GB RAM, 256 SSD Almacenamiento",
          ""));
    }
    for (int i = 0; i < (listProductos.length / 2); i++) {
      list.add(articulos(
          context,
          listProductos.elementAt(i + i).imagen,
          listProductos.elementAt(count).imagen,
          listProductos.elementAt(i + i).nombre,
          listProductos.elementAt(count).nombre,
          listProductos.elementAt(i + i).precio,
          listProductos.elementAt(count).precio,
          listProductos.elementAt(i + i).caracteristicas,
          listProductos.elementAt(count).caracteristicas,
          i + i,
          count));
      //Separa las Columnas
      list.add(Divider());
      count += 2;
    }
    return list;
  }

  Widget articulos(context, imagen, imagen2, nombre, nombre2, precio, precio2,
      caracteristicas, caracteristicas2, index, index2) {
    return Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          producto(context, imagen, nombre, precio, caracteristicas, index),
          producto(context, imagen2, nombre2, precio, caracteristicas, index2)
        ]));
  }

  producto(context, imagenp, nombrep, precio, caracteristicas, index) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              gradient: LinearGradient(
                  colors: [Color(0XFF535b67), Color(0xFF454d5a)],
                  begin: Alignment(0.0, 0.0),
                  end: Alignment(0.0, 0.9))),
          child: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => propiedades(listProductos, index)),
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
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            width: 150,
            height: 50,
            child: Text(
              nombrep,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
      ],
    );
  }
}
