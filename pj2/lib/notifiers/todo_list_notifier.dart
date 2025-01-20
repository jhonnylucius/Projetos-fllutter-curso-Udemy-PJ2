import 'package:flutter/material.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/model/todo_filter.dart';

class TodoListNotifier extends ValueNotifier<List<Todo>> {
  TodoListNotifier() : super(_initialValue);

  static final List<Todo> _initialValue = [
    Todo.create('Task 1'),
    Todo.create('Task 2'),
    Todo.create('Task 3'),
    Todo.create('Task 4'),
    Todo.create('Task 5'),
    Todo.create('Task 6'),
    Todo.create('Task 7'),
    Todo.create('Task 8'),
  ];
  final _allTodoNotifier = ValueNotifier<List<Todo>>(_initialValue);
  TodoFilter _currenteFilter = TodoFilter.all;

  List<Todo> get _todos => _allTodoNotifier.value;

  void init() {
    _allTodoNotifier.addListener(() => updateTodoList());
  }

  void add(Todo todo) {
    _allTodoNotifier.value = [...value, todo];
  }

  void update(String id, String task) {
    _allTodoNotifier.value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(task: task)
    ];
  }

  void toggle(String id) {
    _allTodoNotifier.value = [
      for (final todo in value)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
  }

  void remove(String id) {
    _allTodoNotifier.value = value.where((todo) => todo.id != id).toList();
  }

  void changeFilter(TodoFilter filter) {
    _currenteFilter = filter;
    updateTodoList();
  }

  void updateTodoList() {
    value = _mapFilterToTodoList();
  }

  List<Todo> _mapFilterToTodoList() => switch (_currenteFilter) {
        TodoFilter.incomplete =>
          _todos.where((todo) => todo.completed).toList(),
        TodoFilter.completed =>
          _todos.where((todo) => !todo.completed).toList(),
        _ => _todos
      };
}
