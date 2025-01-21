import 'package:flutter/material.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/model/todo_filter.dart';
import 'package:pj2/service/service_locator.dart';
import 'package:pj2/service/storage_services.dart';

class TodoListNotifier extends ValueNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  final _allTodoNotifier = ValueNotifier<List<Todo>>([]);
  TodoFilter _currentFilter = TodoFilter.all;
  final _storageService = getIt<StorageServices>();

  List<Todo> get _todos => _allTodoNotifier.value;

  Future<void> init() async {
    _allTodoNotifier.value = await _storageService.getTodos();
    updateTodoList();
    _allTodoNotifier.addListener(() {
      updateTodoList();
      _saveTodosListBd();
    });
  }

  void update(String id, String task, bool completed) {
    _allTodoNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id)
          todo
        else
          todo.copyWith(task: task, completed: completed)
    ];
    _saveTodosListBd();
  }

  void add(Todo todo) {
    _allTodoNotifier.value = [..._todos, todo];
    _saveTodosListBd();
  }

  void toggle(String id) {
    _allTodoNotifier.value = [
      for (final todo in _todos)
        if (todo.id != id) todo else todo.copyWith(completed: !todo.completed)
    ];
    _saveTodosListBd();
  }

  void remove(String id) {
    _allTodoNotifier.value = _todos.where((todo) => todo.id != id).toList();
    _saveTodosListBd();
  }

  void reorder(List<Todo> todos) {
    _allTodoNotifier.value = todos;
    _saveTodosListBd();
  }

  void changeFilter(TodoFilter filter) {
    _currentFilter = filter;
    updateTodoList();
  }

  void updateTodoList() {
    value = _mapFilterToTodoList();
  }

  void _saveTodosListBd() async {
    await _storageService.saveTodos(_todos);
  }

  List<Todo> _mapFilterToTodoList() {
    switch (_currentFilter) {
      case TodoFilter.incomplete:
        return _todos.where((todo) => !todo.completed).toList();
      case TodoFilter.completed:
        return _todos.where((todo) => todo.completed).toList();
      case TodoFilter.all:
        return _todos;
    }
  }
}
