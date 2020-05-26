import "dart:async";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/user/login_model.dart';

class UserAuth {
  final _auth = FirebaseAuth.instance;

  Future<FirebaseUser> loginUser(
      BuildContext context, String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result.user == null) {
        return null;
      }
      this._populateUser(context, result.user);
      return result.user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<FirebaseUser> createUserAndLogin(BuildContext context,
      String displayName, String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user == null) {
        return null;
      }
      var updateInfo = UserUpdateInfo();
      updateInfo.displayName = displayName;
      await result.user.updateProfile(updateInfo);
      var currentUser = await _auth.currentUser();
      print('USERNAME IS: ${currentUser.displayName}');
      this._populateUser(context, currentUser);
      return currentUser;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<FirebaseUser> checkLoggedIn(BuildContext context) async {
    try {
      var result = await _auth.currentUser();
      if (result == null) {
        return null;
      }
      this._populateUser(context, result);
      return result;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    this._removeUser(context);
  }

  void _populateUser(BuildContext context, FirebaseUser user) {
    var loginModel = Provider.of<LoginModel>(context, listen: false);
    loginModel.populateUser(user);
  }

  void _removeUser(BuildContext context) {
    Provider.of<LoginModel>(context, listen: false).removeUser();
  }
}
