import 'package:buck/core/enums/deadlines.dart';
import 'package:buck/core/models/todo.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AddTodoView extends StatefulWidget {
  @override
  _AddTodoViewState createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  Todo todo = Todo("", deadline: Deadline.Later);

  void updateContent(String content) {
    setState(() {
      todo.content = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Add new",
                    style: headlineStyle,
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                TextField(
                  onSubmitted: updateContent,
                  onChanged: updateContent,
                  cursorColor: Colors.grey,
                  style: TextStyle(fontSize: 30),
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                      hintText: "Enter Task",
                      hintStyle: headlineStyle.copyWith(
                          color: Colors.black.withOpacity(0.21))),
                ),
                SizedBox(height: 80),
                Text(
                  "WHEN",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          todo.deadline = Deadline.Today;
                        });
                      },
                      child: Text("Today",
                          style: TextStyle(
                              fontSize: 15,
                              color: todo.deadline == Deadline.Today
                                  ? kPrimaryColor
                                  : Colors.grey)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          todo.deadline = Deadline.Tomorrow;
                        });
                      },
                      child: Text("Tomorrow",
                          style: TextStyle(
                              fontSize: 15,
                              color: todo.deadline == Deadline.Tomorrow
                                  ? kPrimaryColor
                                  : Colors.grey)),
                    ),
                    Text("Select Date",
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                )
              ],
            ),
          ),
          _addTask(onTap: () {
            Navigator.pop(context, todo);
          })
        ],
      ),
    );
  }

  Align _addTask({Function onTap}) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTap,
        child: Container(
            height: 100,
            width: double.infinity,
            color: kPrimaryColor,
            child: Center(
                child: Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ))),
      ),
    );
  }
}
