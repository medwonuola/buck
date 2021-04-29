import 'package:buck/view/util/add_todo_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';
import '../model.dart';
import 'add_todo.dart';

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
            onPressed: () {},
          ),
          elevation: 0,
          backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _topSection(),
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

  Padding _topSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16)
          .add(EdgeInsets.only(bottom: 30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tasks",
            style: headlineStyle,
          ),
          Icon(
            Icons.notifications_none,
            size: 23,
          )
        ],
      ),
    );
  }
}

class TodoBlock extends StatefulWidget {
  final String day;
  final List<Todo> todo;

  const TodoBlock({Key key, this.day, this.todo}) : super(key: key);

  @override
  _TodoBlockState createState() => _TodoBlockState();
}

class _TodoBlockState extends State<TodoBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              widget.day,
              style: TextStyle(
                  fontSize: 16, letterSpacing: 2, color: kPrimaryColor),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.todo
                  ?.map((e) => Padding(
                        padding: const EdgeInsets.only(left: 32, bottom: 30),
                        child: Flexible(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                e.mark();
                              });
                            },
                            child: Text("  ${e.content}  ",
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 20,
                                    decoration: e.done
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    decorationColor: kPrimaryColor,
                                    decorationThickness: 2,
                                    letterSpacing: 2)),
                          ),
                        ),
                      ))
                  ?.toList(),
            ),
          )
        ],
      ),
    );
  }
}
