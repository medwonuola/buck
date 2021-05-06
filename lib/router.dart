import 'package:buck/view/views/add_todo_view.dart';
import 'package:flutter/material.dart';

import 'view/views/homeview.dart';

const String initialRoute = "home";

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'addTodo':
        return MaterialPageRoute(builder: (_) => AddTodoView());
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
