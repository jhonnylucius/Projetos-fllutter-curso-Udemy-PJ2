import 'package:flutter/material.dart';
import 'package:pj2/model/todo.dart';

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
}
