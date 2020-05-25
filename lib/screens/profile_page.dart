import 'package:flutter/material.dart';
import 'package:therapyapp/charts/happiness.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:therapyapp/charts/db_handler.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:therapyapp/user/login_model.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/constants.dart';

import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  //sets the happiness list for creating the graphs as _syncDataFuture
  Future<List<Happiness>> _syncDataFuture;
  final _auth = FirebaseAuth.instance;
  FirebaseUser user;

  //sets the user to the current user details when called in initstate
  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }


  //this method is called automatically as the page is created
  @override
  void initState() {
    super.initState();
    //sets the uid var to the value of the users uid as the page is initiated, to be used for reading and writing to database
    var uid = Provider.of<LoginModel>(context, listen: false).user.uid;

    //passing the uid over to the syncdata method
    this._syncDataFuture = this._syncData(uid);
    initUser();
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

            //this is a ternary operator. If this is true, show the graphs. if not true, show a loading screen.
            child: Consumer<LoginModel>(
                builder: (context, loginModel, child) =>
                    FutureBuilder<List<Happiness>>(
                        future: this._syncDataFuture,
                        builder: (context, snapshot) => snapshot.hasData
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        Text('Hey ${user.displayName}! Look at the graph below to compare your mood on different days',
                                            style: kProfilePageText,
                                        textAlign: TextAlign.center),
                                        //putting the chart into a container - container must
                                        // have the height hard coded or the graph doesn't show up
                                         SizedBox(
                                              height: 100,
                                            ),
                                        Container(
                                          color: Colors.white,
                                          height: 300,
                                          child: charts.TimeSeriesChart(
                                            //turns the snapshot of data into the chart using toTimeSeries method.
                                            this._toTimeSeries(snapshot.data),
                                            animate: true,
                                          ),
                                        ),
                                      ],
                                    ))),
                              ],
                            )
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

  //reads the happiness list from the database handler ready to put into a graph
  Future<List<Happiness>> _syncData(String uid) async {
    DBHandler dbManager = DBHandler(uid);
    return dbManager.readHappiness();
  }

  //setting up the  chart properties
  List<charts.Series<Happiness, DateTime>> _toTimeSeries(
      //sets the list of data as happinesslevel, so the chart can return it as the data
      List<Happiness> happinessLevel) {
    return [
      charts.Series<Happiness, DateTime>(
          id: "Happiness",
          //the data
          data: happinessLevel,
          //sets colour of the line
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          //x axis label - gets the time from hashmap
          domainFn: (Happiness happiness, _) => happiness.time,
          //y axis label - gets the happiness level from hashmap
          measureFn: (Happiness happiness, _) => happiness.rating),

    ];
  }
}
