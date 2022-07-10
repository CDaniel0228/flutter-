import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Vista/Productos/estructura.dart';
import 'package:flutter_application_1/src/Vista/inicioSesion/estructura.dart';
import 'Catalogo/catalogo.dart';
import 'Compras/compras.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF454d5a),
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Subastas"),
            accountEmail: Text("subasta@gmail.com"),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/login.png')),
                color: Color(0xFF333742)),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    Text(
                      "Catalogo",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => compras()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.card_travel,
                      color: Colors.white,
                    ),
                    Text(
                      "Compras",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EstructuraProducto()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_business,
                      color: Colors.white,
                    ),
                    Text(
                      "Productos",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child: TextButton(
                onPressed: () async {
                  //if (await Autentificacion().signedOut()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => estructura()),
                  );
                  // }
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    Text(
                      "Salir",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
