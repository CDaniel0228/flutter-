import 'package:cloud_firestore/cloud_firestore.dart';

class usuarioM {
  final String nombre;
  final String telefono;
  final String direccion;
  final String email;
  DocumentReference? reference;

//Constructor
  usuarioM(
    this.nombre,
    this.telefono,
    this.direccion,
    this.email,
  );

//
  usuarioM.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data.call() as Map<String, dynamic>,
            reference: snapshot.reference);

//
  usuarioM.fromMap(Map<String, dynamic> map, {this.reference})
      : nombre = map['nombre'],
        telefono = map['telefono'],
        direccion = map['direccion'],
        email = map['email'];

//
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'telefono': telefono,
      'direccion': direccion,
      'email': email,
    };
  }
}
