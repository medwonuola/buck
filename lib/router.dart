import 'view/views/add_todo_view.dart';
import 'view/views/homeview.dart';
import 'view/views/welcome_view.dart';

import 'package:flutter/material.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.Home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RouteNames.AddTodo:
        return MaterialPageRoute(builder: (_) => AddTodoView());
      case RouteNames.Welcome:
        return MaterialPageRoute(builder: (_) => WelcomeView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: Text('View for ${settings.name} not found!'),
                  ),
                ));
    }
  }
}

class RouteNames {
  static const String Home = "/";
  static const String Welcome = "welcome";
  static const String AddTodo = "addTodo";
}
