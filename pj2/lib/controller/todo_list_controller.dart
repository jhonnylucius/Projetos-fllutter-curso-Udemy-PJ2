import 'package:pj2/model/todo.dart';
import 'package:pj2/notifiers/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();

  void add(String task) {
    todoListNotifier.add(Todo.create(task));
  }

  void update(
    String id,
    String task,
    bool completed,
  ) {
    todoListNotifier.update(
      id,
      task,
    );
  }

  void toggle(String id) {
    todoListNotifier.toggle(id);
  }

  void remove(String id) {
    todoListNotifier.remove(id);
  }
}
