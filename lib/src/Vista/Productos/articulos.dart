import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Control/Camara/imagen.dart';
import 'package:flutter_application_1/src/Control/Cuentas/producto_service.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';
import 'package:flutter_application_1/src/Modelo/productosM.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Control/Cuentas/Autentificacion.dart';
import '../menuLateral.dart';

class articulos extends StatefulWidget {
  @override
  _articulosState createState() => _articulosState();
}

class _articulosState extends State<articulos> {
  String dropdownvalue = ' Celulares';

  var imageFile, nombrePath, correoUsuario;
  final ImagePicker _picker = ImagePicker();
  final boxCategoria = TextEditingController();
  final boxNombre = TextEditingController();
  final boxPrecio = TextEditingController();
  final boxCaracteristicas = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<Autentificacion>(context);
    correoUsuario = authService.user?.email;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imagenProducto(context),
            categoriaProducto(),
            nombreProducto(),
            precioProducto(),
            caracteristicasProducto(),
            botonGuardar(),
          ],
        )));
  }

  Widget imagenProducto(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: () {
            showSelectionDialog(context);
          },
          child: setImageView()),
    );
  }

  Widget categoriaProducto() {
    var items = [" Celulares", "Televisores", "Neveras", "Accesorios"];
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Text('Categoria:',
          style: TextStyle(fontSize: 22, color: Colors.white)),
      DropdownButton(
        value: dropdownvalue,
        dropdownColor: Color(0xFF454d5a),
        icon: const Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        },
        style: TextStyle(color: Colors.white, fontSize: 20),
      )
    ]);
  }

  Widget nombreProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxNombre,
            decoration: decoracion("Nombre del producto")));
  }

  Widget precioProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxPrecio,
            decoration: decoracion("precio del producto")));
  }

  Widget caracteristicasProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxCaracteristicas,
            decoration: decoracion("caracteristicas del producto")));
  }

  Widget categoriaProducto2() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxCategoria,
            decoration: decoracion("categoria del producto")));
  }

  Widget botonGuardar() {
    return Container(
        width: 200,
        padding: EdgeInsets.only(top: 30),
        child: RaisedButton(
          color: Color(0xFF11253c),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Text(
            'Guardar',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () async {
            String link = await imagen().uploadFile(imageFile, nombrePath);
            ProductosService().productoAdd(productosM(link, boxNombre.text,
                boxPrecio.text, boxCaracteristicas.text, correoUsuario));
            mensaje().info('Producto guardado');
          },
        ));
  }

  openCamera(BuildContext context) async {
    XFile? foto = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = foto?.path;
      nombrePath = foto?.name;
    });

    Navigator.of(context).pop();
  }

  openGallery(BuildContext context) async {
    XFile? foto = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = foto?.path;
      nombrePath = foto?.name;
    });
    Navigator.of(context).pop();
  }

  Widget setImageView() {
    if (imageFile != null) {
      return Image.file(
        File(imageFile),
        height: 300,
      );
    } else {
      return const Image(
        image: AssetImage('asset/error.png'),
        height: 300,
      );
    }
  }

  Future<void> showSelectionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("¿Escoja la imagen del producto?"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text("Galeria"),
                      onTap: () {
                        openGallery(context);
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camara"),
                      onTap: () {
                        openCamera(context);
                      },
                    )
                  ],
                ),
              ));
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
