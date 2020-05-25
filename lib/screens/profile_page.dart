import 'package:flutter/material.dart';
import 'package:therapyapp/charts/happiness.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapyapp/charts/db_handler.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:therapyapp/user/login_model.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<List<Happiness>> _syncDataFuture;

  @override
  void initState() {
    super.initState();
    var uid = Provider.of<LoginModel>(context, listen: false).user.uid;
    this._syncDataFuture = this._syncData(uid);
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
            backgroundColor: Color(0xFF107dac)),
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF005073), Color(0xFF71c7ec)])),
            child: Consumer<LoginModel>(
                builder: (context, loginModel, child) =>
                    FutureBuilder<List<Happiness>>(
                        future: this._syncDataFuture,
                        builder: (context, snapshot) => snapshot.hasData
                            ? Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                    child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text("Your Happiness Over Time",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 25)),
                                    Container(
                                      height: 500,
                                      child: charts.TimeSeriesChart(
                                        this._toTimeSeries(snapshot.data),
                                        animate: true,
                                      ),
                                    )
                                  ],
                                )))
                            : SizedBox(
                                width: double.infinity,
                                child: Padding(
                                    padding: EdgeInsets.all(50),
                                    child: Center(
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 25),
                                                child:
                                                    CircularProgressIndicator()),
                                            Text("Loading Charts",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(fontSize: 20))
                                          ]),
                                    )))))));
  }

  //getting the happiness list from the database handler ready to put into a graph
  Future<List<Happiness>> _syncData(String uid) async {
    DBHandler dbManager = DBHandler(uid);
    return dbManager.readHappiness();
  }

  //setting up the  chart properties
  List<charts.Series<Happiness, DateTime>> _toTimeSeries(
      List<Happiness> happinessLevel) {
    return [
      charts.Series<Happiness, DateTime>(
          id: "Happiness",
          data: happinessLevel,
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (Happiness happiness, _) => happiness.time,
          measureFn: (Happiness happiness, _) => happiness.rating)
    ];
  }
}
