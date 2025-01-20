import 'package:flutter/material.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/model/todo_filter.dart';
import 'package:pj2/notifiers/todo_list_notifier.dart';

class TodoListController {
  final todoListNotifier = TodoListNotifier();
  final filterNotifier = ValueNotifier<TodoFilter>(TodoFilter.all);

  void init() {
    todoListNotifier.init();
    filterNotifier
        .addListener(() => todoListNotifier.changeFilter(filterNotifier.value));
  }

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

  void changeFilter(TodoFilter filter) {
    filterNotifier.value = filter;
  }
}
