import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:therapyapp/components/navigation_drawer.dart';
import '../constants.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Psycube',
          style: kHeaderText,
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF499CD8), Color(0xFF55C5A6)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5.0,
              ),
              Pulse(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/sam.jpg'),
                ),
              ),
              Text(
                'Sam Lightowler',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Project Manager & AI',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  color: Colors.teal.shade100,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Pulse(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/lucy.jpg'),
                ),
              ),
              Text(
                'Lucy Mccall',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'UI/UX & Databases',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  color: Colors.teal.shade100,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Pulse(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/dom.jpg'),
                ),
              ),
              Text(
                'Dominic Stenton',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Optimisation Engineer',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  color: Colors.teal.shade100,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Pulse(
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage('images/zach.jpg'),
                ),
              ),
              Text(
                'Zach Bharath',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Security & Web Development',
                style: TextStyle(
                  fontFamily: 'Baloo',
                  color: Colors.teal.shade100,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),
    );
  }
}
