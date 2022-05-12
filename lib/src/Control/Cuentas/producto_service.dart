import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Modelo/productosM.dart';

class ProductosService {
  static String collection = "Productos";

//Crear Citas
  productoAdd(productosM producto) async {
    try {
      await FirebaseFirestore.instance
          .collection(collection)
          .add(producto.toJson());
    } catch (e) {
      print("Producto no creado");
      print(e);
    }
  }

//Buscar Cita
  Future<List<productosM>> getProducto(String email) async {
    List<productosM> sin = [];
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
      return sin;
    }
  }
}
