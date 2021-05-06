import 'package:buck/view/widgets/add_todo_botton.dart';
import 'package:buck/view/widgets/sidebar.dart';
import 'package:buck/view/widgets/todo_block.dart';
import 'package:buck/view/widgets/top_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../core/models/todo.dart';
import 'add_todo_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todo> todoList = [];

  List<Todo> today = [];
  List<Todo> tomorrow = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (BuildContext context) => SideBar(),
                ),
              );
            },
          ),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                TopSection(),
                today.isNotEmpty
                    ? TodoBlock(
                        day: "Today",
                        todo: today,
                      )
                    : Container(),
                tomorrow.isNotEmpty
                    ? TodoBlock(
                        day: "Tomorrow",
                        todo: tomorrow,
                      )
                    : Container()
              ],
            ),
          ),
          AddTodoButton(
            onTap: addTodo,
          )
        ],
      ),
    );
  }

  Future<void> addTodo() async {
    var newTodo = await Navigator.push(context,
        CupertinoPageRoute(builder: (BuildContext context) => AddTodoView()));
    if (newTodo != null)
      setState(() {
        todoList.add(newTodo);
        newTodo.later ? tomorrow.add(newTodo) : today.add(newTodo);
      });
  }
}
