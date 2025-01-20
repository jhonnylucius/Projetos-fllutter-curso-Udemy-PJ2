import 'package:flutter/material.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/service/service_locator.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;
  final controller = getIt<TodoListController>();

  @override
  void initState() {
    todoController = TextEditingController(text: widget.todo.task);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: todoController,
        decoration: InputDecoration.collapsed(
          hintText: 'Escreva sua tarefda',
        ),
        onChanged: onChanged,
      ),
      leading: Checkbox.adaptive(
        value: widget.todo.completed,
        onChanged: onToggled,
      ),
      trailing: IconButton(
        onPressed: onDeleted,
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.delete_forever_sharp),
      ),
    );
  }

  void onChanged(String task) {
    controller.update(
      widget.todo.id,
      task,
      widget.todo.completed,
    );
  }

  void onToggled(_) {
    controller.toggle(widget.todo.id);
  }

  void onDeleted() {
    controller.remove(widget.todo.id);
  }
}
