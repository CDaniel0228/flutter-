import 'package:flutter/material.dart';

import '../menuLateral.dart';

class compras extends StatelessWidget {
  final boxBuscar = TextEditingController();
  //Filtrar
  final boxPrecio = TextEditingController();
  final boxMarca = TextEditingController();
  final boxEGratis = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Compras'),
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
          children: [],
        )));
  }
}
