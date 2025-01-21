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
  final List<ButtonSegment<TodoFilter>> segments = [
    ButtonSegment(
      value: TodoFilter.all,
      label: Text('Todas'),
      icon: Icon(Icons.list_alt),
    ),
    ButtonSegment(
      value: TodoFilter.incomplete,
      label: Text('A Fazer'),
      icon: Icon(Icons.pending_actions),
    ),
    ButtonSegment(
      value: TodoFilter.completed,
      label: Text('Concluída'),
      icon: Icon(Icons.task_alt),
    ),
  ];

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: segments.length,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text('To Do App'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SegmentedButton<TodoFilter>(
                  segments: segments,
                  selected: {controller.filterNotifier.value},
                  onSelectionChanged: (Set<TodoFilter> selected) {
                    controller.changeFilter(selected.first);
                  },
                ),
              ),
            )),
        body: ListView(
          children: [
            ValueListenableBuilder(
              valueListenable: controller.filterNotifier,
              builder: (context, filter, child) {
                if (filter == TodoFilter.completed) {
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
