import 'package:flutter/material.dart';
import 'widgets/todo_list.dart';
void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoList(title: 'Todo List'),
    );
  }
}