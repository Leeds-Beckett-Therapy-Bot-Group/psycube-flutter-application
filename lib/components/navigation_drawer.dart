import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/screens/chat_page.dart';
import 'package:therapyapp/screens/home_page.dart';

// todo: needs refactoring to have route maps and made prettier etc..

class NavigationDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Navigation'),
            decoration: BoxDecoration(
                color: kAccentBlue
            ),
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
            barTitle: Text(
              'Chat'
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/ChatBot');
            }
          ),
        ],
      ),
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