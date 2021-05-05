import 'package:buck/constants/constants.dart';
import 'package:flutter/material.dart';

import 'view/screens/home.dart';

void main() => runApp(Buck());

class Buck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          canvasColor: Colors.white,
          primaryIconTheme: IconThemeData(color: Colors.black)),
      title: 'Buck',
      home: Home(),
    );
  }
}
