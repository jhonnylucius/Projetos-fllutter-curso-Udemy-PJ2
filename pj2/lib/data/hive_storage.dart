import 'dart:convert';

import 'package:hive_flutter/adapters.dart';
import 'package:pj2/model/todo.dart';
import 'package:pj2/service/storage_services.dart';

class HiveStorage extends StorageServices {
  static const todosBoxName = 'todos';

  @override
  Future<List<Todo>> getTodos() async {
    final todosBox = Hive.box<String>(todosBoxName);
    return todosBox.values
        .map((todo) => Todo.fromJson(jsonDecode(todo)))
        .toList();
  }

  @override
  Future<void> saveTodos(List<Todo> todos) async {
    final todosBox = Hive.box<String>(todosBoxName);
    await todosBox.clear();

    for (final todo in todos) {
      await todosBox.add(jsonEncode(todo.json()));
    }
  }
}
