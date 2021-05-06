import 'package:buck/constants/constants.dart';
import 'package:buck/locator.dart';
import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  setupLocator();
  runApp(Buck());
}

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
      initialRoute: RouteNames.Home,
      onGenerateRoute: Routing.generateRoute,
    );
  }
}
