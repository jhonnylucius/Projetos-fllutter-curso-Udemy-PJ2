import 'package:get_it/get_it.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/data/hive_storage.dart';
import 'package:pj2/service/storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Registrar primeiro o storage
  getIt.registerLazySingleton<StorageServices>(() => HiveStorage());

  // Depois registrar o controller
  getIt.registerLazySingleton<TodoListController>(() {
    final controller = TodoListController();
    controller.init();
    return controller;
  });
}
