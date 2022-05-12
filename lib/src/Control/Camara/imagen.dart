import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class imagen {
  final FirebaseStorage storage = FirebaseStorage.instance;

//guarda las imagenes
  Future<String> uploadFile(filePath, fileName) async {
    File archivo = File(filePath);
    try {
      var linking = await storage.ref('test/$fileName').putFile(archivo);
      String link = await linking.ref.getDownloadURL();
      print(link);
      return link;
    } on FirebaseException catch (e) {
      print(e);
      return 'null';
    }
  }

//devuelve todas la imagenes
  Future<ListResult> listaImagenes() async {
    ListResult result = await storage.ref('test').listAll();
    result.items.forEach((Reference ref) {
      print(ref);
    });
    print(result);
    return result;
  }

//devuelve url de las imagenes
  Future<String> url(fileName) async {
    String url = await storage.ref('test/$fileName').getDownloadURL();
    return url;
  }
}
