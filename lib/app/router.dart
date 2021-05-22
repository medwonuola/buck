import 'package:buck/views/screens/add_todo/add_todo_view.dart';
import 'package:buck/views/screens/home/home_view.dart';
import 'package:buck/views/screens/side_bar.dart';
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
    case SideBarRoute:
      return slideFromLeftPageRoute(SideBar());
    default:
      return MaterialPageRoute(builder: (context) => WelcomeView());
  }
}

const String HomeRoute = "/";
const String WelcomeRoute = "welcome";
const String AddTodoRoute = "addTodo";
const String SideBarRoute = "sidebar";


Route slideFromLeftPageRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1, 0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}
