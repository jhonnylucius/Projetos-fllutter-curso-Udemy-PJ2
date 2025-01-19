import 'package:flutter/material.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/widgets/todo_list_widget.dart';

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
    todoController = TextEditingController(text: widget.todo.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TodoListWidget(todo: todoList[index].task),
    );
  }
}
