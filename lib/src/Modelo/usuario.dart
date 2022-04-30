import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class usuario with ChangeNotifier {
  String id;
  String displayName;
  String photoURL;
  String email;

  usuario({
    this.id = "",
    this.displayName = "",
    this.photoURL = "",
    this.email = "",
  });

  factory usuario.fromFirestore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data as Map;
    return usuario(
      id: userDoc.id,
      displayName: userData['displayName'],
      photoURL: userData['photoURL'],
      email: userData['email'],
    );
  }

  void setFromFireStore(DocumentSnapshot userDoc) {
    Map userData = userDoc.data as Map;
    id = userDoc.id;
    displayName = userData['displayName'];
    photoURL = userData['photoURL'];
    email = userData['email'];
    notifyListeners();
  }
}
