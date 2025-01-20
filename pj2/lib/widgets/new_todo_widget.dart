import 'package:flutter/material.dart';
import 'package:pj2/controller/todo_list_controller.dart';
import 'package:pj2/service/service_locator.dart';

class NewTodoWidget extends StatefulWidget {
  const NewTodoWidget({
    super.key,
  });

  @override
  State<NewTodoWidget> createState() => _NewTodoWidgetState();
}

class _NewTodoWidgetState extends State<NewTodoWidget> {
  late TextEditingController todoController =
      todoController = TextEditingController();
  final controller = getIt<TodoListController>();
  final todoNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Form(
          key: formKey,
          child: TextFormField(
            focusNode: todoNode,
            controller: todoController,
            decoration: InputDecoration.collapsed(
              hintText: 'Escreva uma nova tarefa...',
            ),
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'Campo obrigatório';
              }
              return null;
            },
            onFieldSubmitted: (_) => onSubmitted,
          ),
        ),
        leading: const Checkbox.adaptive(
          value: false,
          onChanged: null,
        ),
        trailing: TextButton(
          onPressed: onSubmitted,
          child: const Text('salvar'),
        ));
  }

  void onSubmitted() {
    if (!formKey.currentState!.validate()) return;

    controller.add(todoController.text);
    formKey.currentState!.reset();

    todoNode.unfocus();
  }
}
