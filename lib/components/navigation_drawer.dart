import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/screens/chat_page.dart';
import 'package:therapyapp/screens/home_page.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          NavDrawHeader(
            accountName: Text(
                'PsyCube Example',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            accountEmail: Text('psycube@gmail.com'),
          ),
          NavTile(
            barTitle: Text(
              'Home',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/HomePage');
            },
          ),
          NavTile(
              barTitle: Text('Chat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/ChatBot');
              }),
          NavTile(
            barTitle: Text(
              'Profile'
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/ProfilePage');
            },
          ),
          NavTile(
            barTitle: Text(
              'Settings'
            ),
            onTap: () {
              Navigator.pushNamed(context, '/SettingsPage');
            },
          ),
          NavTile(
            barTitle: Text(
                'About'
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/AboutPage');
            },
          ),
        ],
      ),
    );
  }
}

class NavDrawHeader extends StatelessWidget {
  NavDrawHeader({@required this.accountName, @required this.accountEmail});

  final Text accountName;
  final Text accountEmail;
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF005073), Color(0xFF71c7ec)])
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
        Row(
            children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('images/avatar.png'),
          ),
        ]),
        SizedBox(
          height: 20,
        ),
        Row(children: <Widget>[
          accountName,
        ]),
        Row(children: <Widget>[
          accountEmail,
        ]),
      ]),
    );
  }
}

class NavTile extends StatelessWidget {
  NavTile({@required this.barTitle, @required this.onTap});

  final Text barTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: barTitle,
      onTap: onTap,
    );
  }
}
