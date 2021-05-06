import 'package:buck/core/enums/deadlines.dart';

class Todo {
  String content;
  Deadline deadline;
  bool done = false;
  // TODO: set up DateTime for deadlines

  Todo(this.content, {this.deadline = Deadline.Today});

  void mark() {
    done = !done;
  }
}
