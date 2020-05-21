//doms about page placeholder
import 'package:flutter/material.dart';
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
    );
  }
}
