class Todo {
  Todo({required this.task, required this.completed});
  final String task;
  final bool completed;

  factory Todo.create(String task) {
    return Todo(task: task, completed: false);
  }
}
