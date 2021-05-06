import 'package:buck/view/views/add_todo_view.dart';
import 'package:flutter/material.dart';

import 'view/views/homeview.dart';
import 'view/views/welcome_view.dart';

const String initialRoute = "home";

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'addTodo':
        return MaterialPageRoute(builder: (_) => AddTodoView());
      case 'welcome':
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
