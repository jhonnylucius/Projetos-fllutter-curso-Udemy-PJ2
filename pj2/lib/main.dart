import 'package:flutter/material.dart';
import 'package:pj2/screens/todo_list_screen.dart';
import 'package:pj2/service/service_locator.dart';

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(120, 73, 36, 238)),
        useMaterial3: true,
      ),
      home: const TodoListScreen(),
    );
  }
}
