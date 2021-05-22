import 'package:buck/app/router.dart';
import 'package:buck/core/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Todo> _list = [];

  Future<void> addTodo(BuildContext context) async {
    var newTodo = await Navigator.pushNamed(context, AddTodoRoute);
    if (newTodo != null) _list.add(newTodo);
  }
}
