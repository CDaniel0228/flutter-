import 'package:cloud_firestore/cloud_firestore.dart';

import '../../Modelo/productosM.dart';

class CompraService {
  static String collection = "Compras";

//Crear Compra
  productoAdd(productosM producto) async {
    try {
      await FirebaseFirestore.instance
          .collection(collection)
          .add(producto.toJson());
    } catch (e) {
      print("Compra no creada");
      print(e);
    }
  }

//Buscar Compra
  Future<List<productosM>> getCompraEmail(String email) async {
    List<productosM> error = [];
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection(collection)
          .where('email', isEqualTo: email)
          .get();

      List<productosM> citas = [];
      for (var element in snapshot.docs) {
        citas.add(productosM.fromSnapshot(element));
      }

//ordena lista
      citas.sort((a, b) => b.nombre.compareTo(a.nombre));
      return citas;
    } catch (e) {
      print(e);
      return error;
    }
  }
}
