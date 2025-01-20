import 'package:pj2/notifiers/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();

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
