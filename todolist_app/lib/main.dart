import 'package:flutter/material.dart';
import 'package:todolist_app/screens/todo_list.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const TodoList(),
      debugShowCheckedModeBanner: false,
    );
  } 
}
