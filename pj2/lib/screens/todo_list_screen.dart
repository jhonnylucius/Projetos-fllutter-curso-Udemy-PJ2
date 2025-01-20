import 'package:flutter/material.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/model/todo_filter.dart';
import 'package:pj2/service/service_locator.dart';
import 'package:pj2/widgets/new_todo_widget.dart';
import 'package:pj2/widgets/todo_list_widget.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreen();
}

class _TodoListScreen extends State<TodoListScreen> {
  final controller = getIt<TodoListController>();
  static const List<Tab> tabs = [
    Tab(text: 'Todas'),
    Tab(text: 'A Fazer'),
    Tab(text: 'Concluida'),
  ];

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('To Do App'),
            bottom: TabBar(
              tabs: tabs,
              onTap: (index) {
                controller.changeFilter(TodoFilter.values[index]);
              },
            )),
        body: ListView(
          children: [
            ValueListenableBuilder(
              valueListenable: controller.filterNotifier,
              builder: (context, filter, child) {
                if (filter != TodoFilter.completed) {
                  return const SizedBox.shrink();
                }
                return const NewTodoWidget();
              },
            ),
            TodoListWidget(),
          ],
        ),
      ),
    );
  }
}
