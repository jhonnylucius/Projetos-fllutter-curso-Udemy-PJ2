import 'package:pj2/model/todo.dart';

abstract class StorageServices {
  Future<List<Todo>> getTodos();
  Future<void> saveTodos(List<Todo> todos);
}
