import 'package:buck/core/model/task_model.dart';
import 'package:buck/styles/colors.dart';
import 'package:buck/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'add_todo_viewmodel.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTodoViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text("Add new", style: headlineStyle),
                  ),
                  SizedBox(height: 120),
                  TextField(
                    onSubmitted: model.updateContent,
                    onChanged: model.updateContent,
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
                  Text("WHEN",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _setDeadlineUI(
                          day: "Today",
                          deadline: model.deadline,
                          onTap: () => model.setDeadline(Deadline.Today)),
                      _setDeadlineUI(
                          day: "Tomorrow",
                          deadline: model.deadline,
                          onTap: () => model.setDeadline(Deadline.Tomorrow))
                      //TODO: implement later deadline selection
                    ],
                  )

                ],
              ),
            ),
            _addTask(onTap: () => model.addTask(context))
          ],
        ),
      ),
      viewModelBuilder: () => AddTodoViewModel(),
    );
  }

  _setDeadlineUI({String day, Deadline deadline, Function onTap}) => TextButton(
      onPressed: onTap,
      child: Text(day,
          style: TextStyle(
            fontSize: 15,
            color: deadline == Deadline.Today ? kPrimaryColor : Colors.grey,
          )));

  _addTask({@required Function onTap}) => Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          width: double.infinity,
          color: kPrimaryColor,
          child: Center(
              child: Text("Add Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500))),
        ),
      ));
}
