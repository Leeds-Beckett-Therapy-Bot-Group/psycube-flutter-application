import 'package:flutter/material.dart';
import 'package:therapyapp/constants.dart';
import 'package:therapyapp/screens/chat_page.dart';

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
          ListTile(
            title: Text('Chat'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ChatBot();
                  }
              ));
            },
          ),
        ],
      ),
    );
  }
}