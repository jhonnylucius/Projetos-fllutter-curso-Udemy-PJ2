import 'package:flutter/material.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/service/service_locator.dart';
import 'package:pj2/widgets/todo_item_widget.dart';

class TodoListWidget extends StatelessWidget {
  TodoListWidget({super.key});

  final controller = getIt<TodoListController>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.todoListNotifier,
      builder: (context, todoList, child) {
        return ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return TodoItemWidget(todo: todoList[index]);
          },
        );
      },
    );
  }
}
