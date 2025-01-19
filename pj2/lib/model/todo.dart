class Todo {
  final String title;
  final bool completed;

  factory Todo.create(String task) {
    return Todo(task: task, completed: false);
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "completed": completed,
      };
}
