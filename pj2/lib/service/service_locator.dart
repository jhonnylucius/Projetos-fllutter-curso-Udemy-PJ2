import 'package:get_it/get_it.dart';
import 'package:pj2/controller/todo_list_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register services
  // Register controllers
  // Register notifiers
  getIt.registerLazySingleton<TodoListController>(() => TodoListController());
}
