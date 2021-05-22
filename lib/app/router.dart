import 'package:buck/views/screens/add_todo/add_todo_view.dart';
import 'package:buck/views/screens/home/home_view.dart';
import 'package:buck/views/screens/welcome/welcome_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case WelcomeRoute:
      return MaterialPageRoute(builder: (context) => WelcomeView());
    case AddTodoRoute:
      return CupertinoPageRoute(builder: (context) => AddTodoView());
    default:
      return MaterialPageRoute(builder: (context) => WelcomeView());
  }
}

const String HomeRoute = "/";
const String WelcomeRoute = "welcome";
const String AddTodoRoute = "addTodo";