enum Deadline { Today, Tomorrow, Later }

class Todo {
  String content;
  Deadline deadline;

  bool done = false;

  Todo(this.content) {
    setDeadline(Deadline.Today);
  }

  void mark() {
    done = !done;
  }

  int _deadlineDay;

  int get deadlineDay => _deadlineDay;

  void setDeadline(Deadline deadline) {
    switch (deadline) {
      case Deadline.Today:
        _deadlineDay = DateTime.now().day;
        break;
      case Deadline.Tomorrow:
        _deadlineDay = DateTime.now().day + 1;
        break;
      default:
        _deadlineDay = DateTime.now().day;
    }
  }
}
