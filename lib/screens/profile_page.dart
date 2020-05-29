import "dart:async";
import 'package:flutter/material.dart';
import 'package:therapyapp/charts/happiness.dart';
import '../components/navigation_drawer.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/charts/db_handler.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:therapyapp/user/login_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animator/flutter_animator.dart';
import '../constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //sets the happiness list for creating the graphs as _syncDataFuture
  Future<List<Happiness>> _syncDataFuture;

  //this method is called automatically as the page is created
  @override
  void initState() {
    super.initState();
    //sets the uid var to the value of the users uid as the page is initiated, to be used for reading and writing to database
    var uid = Provider.of<LoginModel>(context, listen: false).user.uid;
    //passing the uid over to the syncdata method
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
                    colors: [Color(0xFF499CD8), Color(0xFF55C5A6)])),

            //this is a ternary operator. If this is true, show the graphs. if not true, show a loading screen.
            child: Consumer<LoginModel>(
                builder: (context, loginModel, child) => FutureBuilder<
                        List<Happiness>>(
                    future: this._syncDataFuture,
                    builder: (context, snapshot) => snapshot.hasData
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Container(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      BounceInUp(
                                        child: Text(
                                          'Welcome back!',
                                          style: kProfileHeaderText,
                                        ),
                                      ),
                                      Consumer<LoginModel>(
                                          builder: (context, loginModel,
                                                  child) =>
                                              BounceInUp(
                                                child: Text(
                                                    'Logged in as: ${loginModel.user.email}',
                                                    style: kProfilePageText,
                                                    textAlign: TextAlign.center),
                                              )),
                                      //putting the chart into a container - container must
                                      // have the height hard coded or the graph doesn't show up
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text(
                                        'Your Happiness over time',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Baloo',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          color: Color(0xFF107dac),
                                        ),
                                        height: 400,
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
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Consumer<LoginModel>(
                                        builder: (context, loginModel, child) =>
                                            BounceInDown(
                                              child: Text(
                                                  'Logged in as: ${loginModel.user.displayName}',
                                                  style: kProfilePageText,
                                                  textAlign: TextAlign.left),
                                            ),
                                      ),
                                      //putting the chart into a container - container must
                                      // have the height hard coded or the graph doesn't show up
                                      SizedBox(
                                        height: 100,
                                      ),
                                      Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(right: 25),
                                                child:
                                                    CircularProgressIndicator()),
                                            BounceInDown(
                                              child: Text("Loading Graph...",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 20)),
                                            )
                                          ]),
                                    ],
                                  ),
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
          colorFn: (_, __) => charts.MaterialPalette.black,
          //x axis label - gets the time from hashmap
          domainFn: (Happiness happiness, _) => happiness.time,
          //y axis label - gets the happiness level from hashmap
          measureFn: (Happiness happiness, _) => happiness.rating),
    ];
  }
}
