import 'package:buck/constants.dart';
import 'package:buck/view/util/add_todo_botton.dart';
import 'package:buck/view/util/todo_block.dart';
import 'package:buck/view/util/top_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model.dart';
import 'add_todo.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("TASK APP"),
          leading: Container(),
          actions: [
            IconButton(
              icon: Icon(Icons.highlight_remove, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 72),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...["Dashboard", "Calender", "Categorize Tasks", "Setting"]
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                    )),
            ...[
              "About",
              "Privacy",
              "License",
            ].map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    e,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ))
          ]),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        CupertinoPageRoute(builder: (BuildContext context) => AddTodo()));
    if (newTodo != null)
      setState(() {
        todoList.add(newTodo);
        newTodo.later ? tomorrow.add(newTodo) : today.add(newTodo);
      });
  }
}
