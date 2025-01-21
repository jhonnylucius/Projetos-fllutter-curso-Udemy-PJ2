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
  TodoFilter _currentFilter = TodoFilter.all;

  List<Todo> get _todos => _allTodoNotifier.value;

  void init() {
    _allTodoNotifier.addListener(() => updateTodoList());
  }

  void add(Todo todo) {
    _allTodoNotifier.value = [
      ..._todos,
      todo
    ]; // Corrigido de value para _todos
  }

  void update(String id, String task, bool completed) {
    _allTodoNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id)
          todo
        else
          todo.copyWith(task: task, completed: completed)
    ];
  }

  void toggle(String id) {
    _allTodoNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
    updateTodoList();
  }

  void remove(String id) {
    _allTodoNotifier.value = _todos.where((todo) => todo.id != id).toList();
  }

  void reorder(List<Todo> todos) {
    _allTodoNotifier.value = todos;
  }

  void changeFilter(TodoFilter filter) {
    _currentFilter = filter;
    updateTodoList();
  }

  void updateTodoList() {
    value = _mapFilterToTodoList();
  }

  List<Todo> _mapFilterToTodoList() => switch (_currentFilter) {
        TodoFilter.incomplete =>
          _todos.where((todo) => !todo.completed).toList(),
        TodoFilter.completed => _todos.where((todo) => todo.completed).toList(),
        _ => _todos
      };
}
