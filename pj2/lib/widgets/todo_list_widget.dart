import 'package:flutter/material.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/model/todo_filter.dart';
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
        var isFilterAll = controller.filterNotifier.value == TodoFilter.all;
        var isFilterIncomplete =
            controller.filterNotifier.value == TodoFilter.incomplete;
        var isFilterCompleted =
            controller.filterNotifier.value == TodoFilter.completed;

        if (todoList.isEmpty && (isFilterIncomplete || isFilterCompleted)) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Vazio'),
            ),
          );
        }

        return ReorderableListView.builder(
          primary: false,
          shrinkWrap: true,
          buildDefaultDragHandles: isFilterAll,
          itemCount: todoList.length,
          onReorder: controller.reorder,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return TodoItemWidget(key: ValueKey(todo.id), todo: todo);
          },
        );
      },
    );
  }
}
