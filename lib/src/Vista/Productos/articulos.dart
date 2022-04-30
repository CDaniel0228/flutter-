import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../menuLateral.dart';

class articulos extends StatefulWidget {
  @override
  _articulosState createState() => _articulosState();
}

class _articulosState extends State<articulos> {
  var imageFile;
  final ImagePicker _picker = ImagePicker();

  final boxNombre = TextEditingController();
  //Filtrar
  final boxPrecio = TextEditingController();
  final boxMarca = TextEditingController();
  final boxEGratis = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        color: Color(0xFF333742),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [imagenProducto(context), nombreProducto()],
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

  Widget nombreProducto() {
    return Padding(
        //flatbutton
        padding: const EdgeInsets.only(left: 50, right: 50, top: 30),
        child: TextField(
            controller: boxNombre,
            obscureText: true,
            decoration: decoracion("Nombre del producto")));
  }

  openCamera(BuildContext context) async {
    XFile? foto = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = foto?.path;
    });

    Navigator.of(context).pop();
  }

  openGallery(BuildContext context) async {
    XFile? foto = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = foto?.path;
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
        image: AssetImage('asset/login.png'),
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
