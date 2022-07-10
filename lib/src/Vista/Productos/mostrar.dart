import 'package:flutter/material.dart';
import '../../Modelo/productosM.dart';
import '../menuLateral.dart';

class MostrarProductos extends StatelessWidget {
  List<productosM> productos;
  MostrarProductos(this.productos);

  var correo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Mis productos'),
            centerTitle: true,
            backgroundColor: Color(0xFF11253c)),
        drawer: MenuLateral(),
        body: SingleChildScrollView(child: panel(context)));
  }

  Widget panel(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listaProducto(context),
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

  List<Widget> generateItem(context) {
    final list = <Widget>[];
    for (int i = 0; i < (productos.length); i++) {
      list.add(articulos(
          context,
          productos.elementAt(i).imagen,
          productos.elementAt(i).nombre,
          productos.elementAt(i).precio,
          productos.elementAt(i).caracteristicas,
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
        padding: EdgeInsets.only(top: 0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          producto(context, imagen, nombre, precio, caracteristicas, index),
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
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => propiedades(listProductos, index)),
                );*/
              },
              child: Image(fit: BoxFit.fill, image: NetworkImage(imagenp))),
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
