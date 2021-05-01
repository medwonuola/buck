class Todo {
  bool later = false;
  String content;
  bool done = false;

  Todo(this.content, {this.later});

  void mark(){
    done = !done;
  }
}
