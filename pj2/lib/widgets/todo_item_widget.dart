import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pj2/model/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({super.key, required this.todo});

  final Todo todo;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  late TextEditingController todoController;

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
        onChanged: onToggled,
      ),
      leading: Checkbox(
        value: widget.todo.completed,
        onChanged: onToggled,
      ),
      trailing: IconButton(
        onPressed: onDeleted,
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.close_rounded),
      ),
    );
  }

  void onChanged(String task) {
    Logger().e(task);
  }

  void onToggled(_) {
    Logger().e(_);
  }

  void onDeleted() {
    Logger().e('deleted');
  }
}
