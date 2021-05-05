import 'package:buck/core/enums/deadlines.dart';

class Todo {
  String content;
  Deadline deadline;
  bool done = false;
  DateTime date;

  Todo(this.content, {this.deadline = Deadline.Today});

  void mark() {
    done = !done;
  }
}
