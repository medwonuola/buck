enum Deadline { Today, Tomorrow, Later }

class Todo {
  String content;
  Deadline deadline;
  bool done = false;

  Todo(this.content, {this.deadline = Deadline.Today});

  void mark() {
    done = !done;
  }
}
