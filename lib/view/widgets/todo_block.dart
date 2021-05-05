import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../core/models/todo_model.dart';

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
