import 'package:flutter/material.dart';
import 'package:therapyapp/firebasedb_data.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  DBManager dataManager = DBManager();
  final _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUser();
  }
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Psycube',
          style: kHeaderText,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
          backgroundColor: Color(0xFF107dac)
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF005073), Color(0xFF71c7ec)])),
        child: Column(
          children: <Widget>[
            FlatButton(
                child: Text(
                    'write data'
                ),
                onPressed: () {
                  dataManager.writeData("${user?.uid}");
                }
            ),
            FlatButton(
                child: Text(
                    'read data'
                ),
                onPressed: () {
                  dataManager.readData("${user?.uid}");
                }
            ),
            FlatButton(
                child: Text(
                    'updatedata'
                ),
                onPressed: () {
                  dataManager.readData("${user?.uid}");
                }
            ),
          ],
        ),
      ),
    );
  }
}
