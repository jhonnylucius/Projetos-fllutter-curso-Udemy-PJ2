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
    //updateTodoList();
    updateTodoList();
    _allTodoNotifier.addListener(() {
      updateTodoList();
      _saveTodosListBd();
    });
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

  void _saveTodosListBd() {
    _storageService
        .saveTodos(_todos.where((todo) => todo.task.isNotEmpty).toList());
  }

  List<Todo> _mapFilterToTodoList() => switch (_currentFilter) {
        TodoFilter.incomplete =>
          _todos.where((todo) => !todo.completed).toList(),
        TodoFilter.completed => _todos.where((todo) => todo.completed).toList(),
        _ => _todos
      };
}
