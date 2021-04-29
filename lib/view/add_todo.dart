import 'package:buck/model.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  Todo todo = Todo("", later: true);

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
                  style: TextStyle(fontSize: 24),
                  minLines: 1,
                  maxLines: 4,
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
                          todo.later = false;
                        });
                      },
                      child: Text("Today",
                          style: TextStyle(
                              fontSize: 15,
                              color: todo.later ? Colors.grey : kPrimaryColor)),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          todo.later = true;
                        });
                      },
                      child: Text("Tomorrow",
                          style: TextStyle(
                              fontSize: 15,
                              color: todo.later ? kPrimaryColor : Colors.grey)),
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
