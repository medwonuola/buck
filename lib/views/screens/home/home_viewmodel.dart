import 'package:buck/app/router.dart';
import 'package:buck/core/model/task_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  List<Todo> _list = [];

  List<Todo> todayTodo = [];
  List<Todo> tomorrowTodo = [];

  Future<void> addTodo(BuildContext context) async {
    var newTodo = await Navigator.pushNamed(context, AddTodoRoute) as Todo;

    if (newTodo != null && newTodo.content != "" || null) {

      _list.add(newTodo);
      newTodo.deadline == Deadline.Tomorrow
          ? tomorrowTodo.add(newTodo)
          : todayTodo.add(newTodo);
      notifyListeners();

    }
  }

  showSideBar(BuildContext context) {
    Navigator.pushNamed(context, SideBarRoute);
  }
}
