import 'package:buck/core/enums/viewstate.dart';
import 'package:buck/core/models/todo.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  List<Todo> todoList = [];

  Future getTodo(dynamic user) async {
    setState(ViewState.Busy);
    //...
    setState(ViewState.Idle);
  }
}
