import './app/router.dart' as router;
import 'package:flutter/material.dart';

void main() => runApp(Buck());

class Buck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buck',
      onGenerateRoute: router.generateRoute,
      initialRoute: router.WelcomeRoute,
    );
  }
}