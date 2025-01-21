import 'package:uuid/uuid.dart';

class Todo {
  Todo({required this.id, required this.task, required this.completed});

  final String id;
  final String task;
  final bool completed;

  factory Todo.create(String task) {
    final uuid = const Uuid().v4();
    return Todo(id: uuid, task: task, completed: false);
  }

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as String,
        task: json['task'] as String,
        completed: json['completed'] as bool,
      );

  Map<String, dynamic> json() => {
        'id': id,
        'task': task,
        'completed': completed,
      };

  Todo copyWith({String? task, bool? completed}) {
    return Todo(
        id: id,
        task: task ?? this.task,
        completed: completed ?? this.completed);
  }
}
