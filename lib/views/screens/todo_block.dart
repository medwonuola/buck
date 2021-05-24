import 'package:buck/core/model/task_model.dart';
import 'package:buck/styles/colors.dart';
import 'package:flutter/material.dart';

class TodoBlock extends StatefulWidget {
  final String day;
  final List<Todo> dayTodoList;

  const TodoBlock({Key key, this.day, this.dayTodoList}) : super(key: key);

  @override
  _TodoBlockState createState() => _TodoBlockState();
}

class _TodoBlockState extends State<TodoBlock> {
  @override
  Widget build(BuildContext context) {
    return widget.dayTodoList != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                deadline(),
                Flexible(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (Todo todo in widget.dayTodoList) _todoWidget(todo)
                  ],
                ))
              ],
            ),
          )
        : Container();
  }

  Widget _todoWidget(Todo todo) => GestureDetector(
        onTap: () {
          setState(() {
            todo.mark();
          });
        },
        child: Text("  ${todo.content}  ",
            softWrap: true,
            style: TextStyle(
                fontSize: 20,
                decoration: todo.done
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: kPrimaryColor,
                decorationThickness: 2,
                letterSpacing: 2)),
      );

  RotatedBox deadline() {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        widget.day,
        style: TextStyle(fontSize: 16, letterSpacing: 2, color: kPrimaryColor),
      ),
    );
  }
}
