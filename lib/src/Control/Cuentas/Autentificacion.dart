import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/Mensajes/mensaje.dart';
import "package:google_sign_in/google_sign_in.dart";

class Autentificacion with ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  //final usuario _usuario = usuario();
  User? user;

//Constructor
  Autentificacion({FirebaseAuth? auth, GoogleSignIn? googleSignIn})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

//Inico con cuenta google
  Future<User?> iniciarSecion({required BuildContext context}) async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      try {
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        user = userCredential.user;
        notifyListeners();
        return user;
      } on FirebaseAuthException catch (e) {
        print("error en la autentificacion");
        return null;
      }
    }
  }

//Iniciar Sesion con Correo y contraseña
  Future<bool> signIn(email, password) async {
    try {
      final usuario = _auth.currentUser;
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(usuario?.emailVerified);
      print('kk');
      if (user != null && usuario?.emailVerified != null) {
        return true;
      } else {
        mensaje().info('Confirmar correo');
        return false;
      }
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

//Crear nuevo usuario
  Future<bool> crearUsuario(email, password) async {
    try {
      final persona = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (persona.user != null) {
        final usuario = _auth.currentUser;
        usuario?.sendEmailVerification();
        mensaje().info("Se envio un enlace de confirmacion al correo");
        return true;
      } else {
        print(persona.toString() + "si esta");
        return false;
      }
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

// Obtener usuario
  Future<String?> getNombre() async {
    return user?.displayName;
  }

  // Esta logueado?
  Future<bool> isSignedIn() async {
    final currentUser = _auth.currentUser;
    return currentUser != null;
  }

//salirCuenta
  Future<bool> signedOut() async {
    try {
      final currentUser = _auth.signOut();
      // ignore: unnecessary_null_comparison
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  User? get usuario => user;
}
