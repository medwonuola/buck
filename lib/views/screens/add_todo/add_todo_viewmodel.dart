import 'package:buck/core/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddTodoViewModel extends BaseViewModel {
  Todo _todo = Todo("", deadline: Deadline.Later);

  void updateContent(String content) {
    _todo.content = content;
    notifyListeners();
  }

  void setDeadline(Deadline deadline) {
    _todo.deadline = deadline;
    notifyListeners();
  }

  Deadline get deadline => _todo.deadline;

  void addTask(BuildContext context) {
    Navigator.pop(context, _todo);
  }
}
