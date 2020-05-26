import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  bool loggedIn = false;
  FirebaseUser user;

  //populates the user information across the whole state
  void populateUser(FirebaseUser user) {
    this.user = user;
    this.loggedIn = true;
    notifyListeners();
  }

  //removes the user information across the whole state
  void removeUser() {
    user = null;
    loggedIn = false;
    notifyListeners();
  }
}
