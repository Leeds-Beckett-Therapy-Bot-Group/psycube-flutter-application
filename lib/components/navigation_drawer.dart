import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapyapp/user/login_model.dart';
import 'package:getflutter/getflutter.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Consumer<LoginModel>(
              builder: (context, loginModel, child) => NavDrawHeader(
                    accountName: Text("${loginModel.user?.displayName}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    accountEmail: Text("${loginModel.user?.email}"),
                  )),
          NavTile(
            barTitle: Text(
              'Activities',
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/HomePage');
            },
          ),
          NavTile(
              barTitle: Text('Chat'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/ChatBot');
              }),
          NavTile(
            barTitle: Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/ProfilePage');
            },
          ),
          NavTile(
            barTitle: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/SettingsPage');
            },
          ),
          NavTile(
            barTitle: Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/AboutPage');
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
              colors: [Color(0xFF005073), Color(0xFF71c7ec)])),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Row(children: <Widget>[
          GFAvatar(
              backgroundImage: AssetImage('images/psycube_0.png'),
              backgroundColor: Colors.transparent,
              shape: GFAvatarShape.square
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
