import 'package:cloud_firestore/cloud_firestore.dart';

class productosM {
  final String imagen;
  final String nombre;
  final String precio;
  final String caracteristicas;
  final String email;
  DocumentReference? reference;

//constructor
  productosM(
      this.imagen, this.nombre, this.precio, this.caracteristicas, this.email);

//get
  productosM.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data.call() as Map<String, dynamic>,
            reference: snapshot.reference);

  productosM.fromMap(Map<String, dynamic> map, {this.reference})
      : imagen = map['imagen'],
        nombre = map['nombre'],
        precio = map['precio'],
        caracteristicas = map['caracteristicas'],
        email = map['email'];

//set
  Map<String, dynamic> toJson() {
    return {
      'imagen': imagen,
      'nombre': nombre,
      'precio': precio,
      'caracteristicas': caracteristicas,
      'email': email
    };
  }
}
