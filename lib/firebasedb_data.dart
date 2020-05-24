import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jiffy/jiffy.dart';


class DBManager {
  final myRef = FirebaseDatabase.instance.reference();
  var currentDate = Jiffy().MMMd;

  void writeData(uid) {
    print(currentDate);
      myRef.child(uid).set({
        currentDate:'5',
      });
    }
  void readData(uid) {
    myRef.child(uid).once().then((DataSnapshot dataSnapshot) {
      dataSnapshot.value;
      print(dataSnapshot.value);
    });
  }
  void updateData(uid) {
    myRef.child(uid).update({
      currentDate: '12',
    });
  }
}
