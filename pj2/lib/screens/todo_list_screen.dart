import 'package:flutter/material.dart';
import 'package:pj2/widgets/todo_list_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreen();
}

class _TodoListScreen extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('To Do App'),
      ),
      body: TodoListWidget(),
    );
  }
}
